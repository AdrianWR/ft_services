<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', '__WORDPRESS_DB_NAME__' );

/** MySQL database username */
define( 'DB_USER', '__WORDPRESS_USER_NAME__' );

/** MySQL database password */
define( 'DB_PASSWORD', '__WORDPRESS_PASSWORD__' );

/** MySQL hostname */
define( 'DB_HOST', '__WORDPRESS_DB_HOST__' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '-zt?x14w.3#faJye& 2/|Km}p>RVlyo>mmVug9lPsur8/hK(6:~:J@~S(+UHq`@!');
define('SECURE_AUTH_KEY',  'n-8C_l y=@HD:>A0|KKlgLw(!y2>d}EH+/mx-(;h$ZEMPBs*+-:] &[SPb2Ze8yh');
define('LOGGED_IN_KEY',    'utIG/1.{:s)<3,A@KJb!B3&ICj5)YY6Q`GH2y?45n{lqH@dM2)AQ2KYN!Nim;V(m');
define('NONCE_KEY',        '-Z:Q|LSq6P+($4 p)V}~J-|,YMrQt/1{c-hKnS=B:|Em9.oh?{w]9!4w~6ZvQJ-#');
define('AUTH_SALT',        'EHVL|=OJR7;iVt>{ZO6Y2dW6A8&j?I,87|1o&GeL1JX[-uE;[DME3c$x5rj0G+k:');
define('SECURE_AUTH_SALT', '.1Mv.L[v9-Rm$mWbF#_/21;[F|afxD;]pVxWd-&m8~A_*n)ecz[Nc++V,of2a`iH');
define('LOGGED_IN_SALT',   '-Y++]%Z+qH-Fb_bxR!J3]W#4EL+NlBSMdt`g9QlkM_?q$<){!+~}|_>w^/k3,hMl');
define('NONCE_SALT',       '  tmME+^AApOh&l&;5Qe}1MnU-`Z^+m}f1OzM$TXWW|hcv]R5wv+7$Oitx8tBnht');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

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
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';