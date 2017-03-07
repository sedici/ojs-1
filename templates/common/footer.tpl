-{**
 * templates/common/footer.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Backend site footer.
 *
 *}
{assign var=brandImage value="templates/images/ojs_brand.png"}
{assign var=packageKey value="common.openJournalSystems"}
{assign var=pkpLink value="http://pkp.sfu.ca/ojs"}
{include file="core:common/footer.tpl"}
{literal}
<script type="text/javascript">
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-15165518-12']);
_gaq.push(['_trackPageview']);
( function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
</script>
{/literal}

