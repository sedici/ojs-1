{**
 * templates/frontend/pages/indexSite.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Site index.
 *
 *}
{include file="frontend/components/header.tpl"}

<div id="main-site" class="page_index_site">

	{if $about}
		<div class="about_site">
			{$about}
		</div>
	{/if}

	<div class="journals">
		<div class="page-header">
			<h2 class="page-title">
				<u>{translate key="plugins.themes.unlpBootstrap.siteTitle"}</u>
			</h2>
		</div>

		{if !count($journals)}
			<div class="no_journals">
				{translate key="site.noJournals"}
			</div>

		{else}
			<ul class="media-list">
				{iterate from=journals item=journal}
                {capture assign="url"}{url journal=$journal->getPath()}{/capture}
                {assign var="thumb" value=$journal->getLocalizedSetting('journalThumbnail')}
                {assign var="description" value=$journal->getLocalizedDescription()}
					<li class="media journal-content">
                        {if $thumb}
                            {assign var="altText" value=$journal->getLocalizedSetting('journalThumbnailAltText')}
							<div class="media-left">
								<a href="{$url|escape}">
									<img class="media-object journal-img" src="{$journalFilesPath}{$journal->getId()}/{$thumb.uploadName|escape:"url"}"{if $altText} alt="{$altText|escape}"{/if}>
								</a>
							</div>
							{else}
						<div class="media-left">
							<a href="{$url|escape}">
								<img class="media-object journal-img" src="/plugins/themes/unlp/templates/images/default-journal.jpg">
							</a>
						</div>
                        {/if}

						<div class="media-body">

							<h3 class="media-heading">
								<a href="{$url|escape}" rel="bookmark">
                                    {$journal->getLocalizedName()}
								</a>
							</h3>
                            {if $description}
								<div class="description col-xs-9 col-md-9">
                                    {$description}
								</div>
                            {/if}
							<ul class="nav pull-right journal-buttons">
								<li class="current journal-current">
									<a class="text-center" href="{url|escape journal=$journal->getPath() page="issue" op="current"}">
										<b> {translate key="site.journalCurrent"} </b>
									</a>
								</li>
								<li class="view journal-view">
									<a class="text-center" href="{$url|escape}">
                                        {translate key="site.journalView"}
									</a>
								</li>
							</ul>
						</div>
					</li>
				{/iterate}
			</ul>

			{if $journals->getPageCount() > 0}
				<div class="cmp_pagination">
					{page_info iterator=$journals}
					{page_links anchor="journals" name="journals" iterator=$journals}
				</div>
			{/if}
		{/if}
	</div>

</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
