<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wpuser' );

/** Database password */
define( 'DB_PASSWORD', 'password' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          ')[uCRX*uLs+yVVHZc:<8JDPg/nuwur=)UX*F!/FCOis3J@.Mi@!{5jX!TZ#BO>0j' );
define( 'SECURE_AUTH_KEY',   '<9SqKyZE-[!&OtOJ`.x@D;zqB`$T=>j*ZN2jtZ7YZ-cD[dE:UiL2D/Je@ADcbPP4' );
define( 'LOGGED_IN_KEY',     '$@9N)t^bb_V:?fN6T~1NR>mrMSTN5u#b)+yiw`sr2WmWtO.J-DfF;s<Nn^pa%+Cf' );
define( 'NONCE_KEY',         'f9<Q[r!-*Q`G^17x}()7Y_M|={XXJn|$t7I?3p%Qrnw`!uX;kOxCHY@6~1:nz^aF' );
define( 'AUTH_SALT',         '[bsy=VAE6+x&X>lk} g6t(K5PKTf0DW+Ls^-HZ=ZlKbW1[7JRo o5q:%a6UN?(~8' );
define( 'SECURE_AUTH_SALT',  ',p,MbEIp(H{<se?-pNoeN,#/&~>*w{j)]ImVO2nRMS<@608-G|{SKmlCay^C#+G`' );
define( 'LOGGED_IN_SALT',    '8a6`G}Ry+DVc#9Pzpt^gY=5KK&k%T6-{;Sr!b#F_+ORvML&V_@W@/(:o_@KZ3!yV' );
define( 'NONCE_SALT',        '~n(=,MLx^Y7U%IB6bT-jR+4K?:{I>!*W&&?$k7Wh[q]<kQw9v[*4ki)P/)Cd,-uL' );
define( 'WP_CACHE_KEY_SALT', 'V5#1mvLK AP<^.Ov7eKkQ*gyI0mFU?.e5x2LI@LMEGu]4C}(]own+XQ7VH?gQ0m&' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
