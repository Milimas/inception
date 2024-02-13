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
define( 'DB_NAME', getenv('DB_NAME') );

/** Database username */
define( 'DB_USER', getenv('DB_USER') );

/** Database password */
define( 'DB_PASSWORD', getenv('DB_PASSWORD') );

/** Database hostname */
define( 'DB_HOST', getenv('DB_HOST') );

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
define( 'AUTH_KEY',          ']vhfPXFSuD;<M2iRe;?LGCo`{gs`8|o-&S,aWhd%I>)%C:t_T#?ZF-{yt.8VX/L}' );
define( 'SECURE_AUTH_KEY',   'No!yarX{6>89Fcj28>Yu<k_R.(2(NT5U[AJJ63}]f6.u!E*I =Wvc&^cozcq?X)5' );
define( 'LOGGED_IN_KEY',     'D;W_=aS?Kig-8hgeYs=3?%ek<m_9N}ZZ4?MOKR^HLsFFC2ft}+[iyC7Ke{`Tv0a=' );
define( 'NONCE_KEY',         'auu+$!uk[0XJtOwTMOD7<tPQx>1Se=|=5qZ@_i;pz]P1W03L^@q|D6L+7p Q8LcU' );
define( 'AUTH_SALT',         'pF.PiyVWXumy|^fPq}0hUWyr(;=4<3T@dr5Fy<jbV=jdo|~_>]}IY,G:643)f[G5' );
define( 'SECURE_AUTH_SALT',  ' b+n;7X4RVXrpv &0?eq2PmJ`6{]5rj/#f2Wu4UPGn:UJWIow4JNn7yWuPNJ2q&T' );
define( 'LOGGED_IN_SALT',    'Cz;S_u--+SDS?gvVeM>5JqqN)04#*6o*(Hj&xdqCkDx>Z,}2`#%M:P|_GxNCvKYV' );
define( 'NONCE_SALT',        '*%9yAAt$*<Y!,x`8.5?oCS:d;GtS-E=QRNFAR?<K`)<o#.oxtpuF;4e-#s1?0e5*' );
define( 'WP_CACHE_KEY_SALT', ',oF!gla})Swn[{/D<>!sW5R*a0I`G[&6TJ;{Dj#_zJu>B5=tHm7S$B>P#<ok@M[a' );


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
