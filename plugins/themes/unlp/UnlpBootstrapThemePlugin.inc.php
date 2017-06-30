<?php

import('lib.pkp.classes.plugins.ThemePlugin');

class UnlpBootstrapThemePlugin extends ThemePlugin {

    public function init() {
        $this->addStyle('bootstrap', 'styles/bootstrap-unlp.less');

        // Load jQuery from a CDN or, if CDNs are disabled, from a local copy.
        $min = Config::getVar('general', 'enable_minified') ? '.min' : '';
        $request = Application::getRequest();
        if (Config::getVar('general', 'enable_cdn')) {
            $jquery = '//ajax.googleapis.com/ajax/libs/jquery/' . CDN_JQUERY_VERSION . '/jquery' . $min . '.js';
            $jqueryUI = '//ajax.googleapis.com/ajax/libs/jqueryui/' . CDN_JQUERY_UI_VERSION . '/jquery-ui' . $min . '.js';
        } else {
            // Use OJS's built-in jQuery files
            $jquery = $request->getBaseUrl() . '/lib/pkp/lib/vendor/components/jquery/jquery' . $min . '.js';
            $jqueryUI = $request->getBaseUrl() . '/lib/pkp/lib/vendor/components/jqueryui/jquery-ui' . $min . '.js';
        }
        // Use an empty `baseUrl` argument to prevent the theme from looking for
        // the files within the theme directory
        $this->addScript('jQuery', $jquery, array('baseUrl' => ''));
        $this->addScript('jQueryUI', $jqueryUI, array('baseUrl' => ''));
        $this->addScript('jQueryTagIt', $request->getBaseUrl() . '/lib/pkp/js/lib/jquery/plugins/jquery.tag-it.js', array('baseUrl' => ''));

        // Load Bootstrap
        $this->addScript('bootstrap', 'bootstrap/js/bootstrap.min.js');
    }

    function getDisplayName() {
        return __('plugins.themes.unlpBootstrap.name');
    }

    function getDescription() {
        return __('plugins.themes.unlpBootstrap.description');
    }
}