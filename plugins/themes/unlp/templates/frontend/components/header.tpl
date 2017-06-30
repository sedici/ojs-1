{**
 * lib/pkp/templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}

{* Determine whether a logo or title string is being displayed *}
{assign var="showingLogo" value=true}
{if $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
	{assign var="showingLogo" value=false}
{/if}

<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{translate|assign:"pageTitleTranslated" key=$pageTitle}{/if}
{include file="core:frontend/components/headerHead.tpl"}
<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}{if $showingLogo} has_site_logo{/if}">
	<div class="pkp_structure_page">

		{* Header *}
		<header class="navbar navbar-default" id="headerNavigationContainer" role="banner">

			{* User profile, login, etc, navigation menu*}
			<div class="container-fluid">
				<div class="row">
					<ul id="navigationUser" class="nav nav-pills tab-list pull-right" role="navigation" aria-label="{translate|escape key="common.navigation.user"}">
						{if $isUserLoggedIn}
							<li>
								<a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" href="{url router=$smarty.const.ROUTE_PAGE page="submissions"}">
									{$loggedInUsername|escape}
									<span class="badge">
										{$unreadNotificationCount}
									</span>
								</a>
								<ul class="dropdown-menu dropdown-menu-right">
									{if array_intersect(array(ROLE_ID_MANAGER, ROLE_ID_ASSISTANT, ROLE_ID_REVIEWER, ROLE_ID_AUTHOR), $userRoles)}
										<li>
											<a href="{url router=$smarty.const.ROUTE_PAGE page="submissions"}">
												{translate key="navigation.dashboard"}
												<span class="badge">
													{$unreadNotificationCount}
												</span>
											</a>
										</li>
									{/if}
									<li>
										<a href="{url router=$smarty.const.ROUTE_PAGE page="user" op="profile"}">
											{translate key="common.viewProfile"}
										</a>
									</li>
									{if array_intersect(array(ROLE_ID_SITE_ADMIN), $userRoles)}
									<li>
										<a href="{if $multipleContexts}{url router=$smarty.const.ROUTE_PAGE context="index" page="admin" op="index"}{else}{url router=$smarty.const.ROUTE_PAGE page="admin" op="index"}{/if}">
											{translate key="navigation.admin"}
										</a>
									</li>
									{/if}
									<li>
										<a href="{url router=$smarty.const.ROUTE_PAGE page="login" op="signOut"}">
											{translate key="user.logOut"}
										</a>
									</li>
									{if $isUserLoggedInAs}
										<li>
											<a href="{url router=$smarty.const.ROUTE_PAGE page="login" op="signOutAsUser"}">
												{translate key="user.logOutAs"} {$loggedInUsername|escape}
											</a>
										</li>
									{/if}
								</ul>
							</li>
						{else}
							{if !$hideRegisterLink}
								<li><a href="{url router=$smarty.const.ROUTE_PAGE page="user" op="register"}">{translate key="navigation.register"}</a></li>
							{/if}
							<li><a href="{url router=$smarty.const.ROUTE_PAGE page="login"}">{translate key="navigation.login"}</a></li>
						{/if}
					</ul>
				</div><!-- user navbar row -->
				<div class="row">
					<div class="col-xs-3 col-sm-6 col-md-offset-2 col-md-4 img-nav">
                        {* Logo or site title. Only use <h1> heading on the homepage.
                           Otherwise that should go to the page title. *}
                        {if $requestedOp == 'index'}
							<h1 class="site-name title">
						{else}
							<div class="site-name">
						{/if}
							<a href="{$homeUrl}" class="navbar-brand navbar-brand-logo img-nav">
								<img src="{$baseUrl}/plugins/themes/unlp/templates/images/revistas-logo.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" />
							</a>
                        {if $requestedOp == 'index'}
							</h1>
                        {else}
							</div>
                    	{/if}
					</div>
					<div class="col-xs-3 col-sm-6 col-md-offset-2 col-md-4">
						<a href="" class="unlp-img navbar-brand navbar-brand-logo">
							<img src="{$baseUrl}/plugins/themes/unlp/templates/images/logo-unlp.png">
						</a>
					</div>
				</div> <!-- images row -->
			</div><!-- .container-fluid -->
		</header><!-- .pkp_structure_head -->

		{* Wrapper for page content and sidebars *}
		<div class="pkp_structure_content container">
			<main class="pkp_structure_main col-xs-12 col-sm-10 col-md-10 col-md-offset-2" role="main">
