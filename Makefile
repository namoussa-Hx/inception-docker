
COMPOSE = docker compose
DOMAIN = namoussa.42.fr
IP = 127.0.0.1
HOSTS_FILE = /etc/hosts


.PHONY: all
all: up hosts


.PHONY: up
up:
	$(COMPOSE) up -d


.PHONY: down
down:
	$(COMPOSE) down


.PHONY: restart
restart: down up -d


.PHONY: hosts
hosts:
	@if ! grep -q "$(DOMAIN)" $(HOSTS_FILE); then \
		echo "$(IP) $(DOMAIN)" | sudo tee -a $(HOSTS_FILE); \
		echo "Added $(DOMAIN) to $(HOSTS_FILE)"; \
	else \
		echo "$(DOMAIN) already exists in $(HOSTS_FILE)"; \
	fi


.PHONY: clean_hosts
clean_hosts:
	@sudo sed -i "/$(DOMAIN)/d" $(HOSTS_FILE) && echo "Removed $(DOMAIN) from $(HOSTS_FILE)" || echo "$(DOMAIN) not found in $(HOSTS_FILE)"


.PHONY: clean
clean: down clean_hosts
