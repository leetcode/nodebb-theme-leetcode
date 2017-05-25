<div class="post-body">
	<!-- IF !reputation:disabled -->
	<div class="vote-buttons">
		<div component="post/upvote" href="#" class="<!-- IF posts.upvoted -->upvoted<!-- ENDIF posts.upvoted -->">
			<i class="fa fa-caret-up vote-button"></i>
		</div>

		<div class="vote-count" component="post/vote-count" data-votes="{posts.votes}">{posts.votes}</div>

		<!-- IF !downvote:disabled -->
		<div class="vote-size" component="post/downvote" href="#" class="<!-- IF posts.downvoted -->downvoted<!-- ENDIF posts.downvoted -->">
			<i class="fa fa-caret-down vote-button"></i>
		</div>
		<!-- ENDIF !downvote:disabled -->
	</div>
	<!-- ENDIF !reputation:disabled -->

	<div class="answer">
		<div class="avatar-meta">
			<span class="icon">
				<a href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->">
					<!-- IF posts.user.picture -->
					<div class="user-img">
						<img component="user/picture" data-uid="{posts.user.uid}" src="{posts.user.picture}" align="left" itemprop="image" />
					</div>
					<!-- ELSE -->
					<div component="user/picture" data-uid="{posts.user.uid}" class="user-icon" style="background-color: {posts.user.icon:bgColor};">{posts.user.icon:text}</div>
					<!-- ENDIF posts.user.picture -->
					<i component="user/status" class="fa fa-circle status {posts.user.status}" title="[[global:{posts.user.status}]]"></i>

				</a>
			</span>

			<div class="user-info">
				<span class="username">
					<a href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->" itemprop="author" data-username="{posts.user.username}" data-uid="{posts.user.uid}">{posts.user.username}</a>
					<span>
						<!-- IMPORT partials/topic/badge.tpl -->

						<!-- IF posts.user.banned -->
						<span class="label label-danger">[[user:banned]]</span>
						<!-- ENDIF posts.user.banned -->
					</span>
				</span>

				<div class="visible-xs-inline-block visible-sm-inline-block visible-md-inline-block visible-lg-inline-block">
					<!-- IF posts.toPid -->
					<button component="post/parent" class="btn btn-xs btn-default hidden-xs" data-topid="{posts.toPid}"><i class="fa fa-reply"></i> @<!-- IF posts.parent.username -->{posts.parent.username}<!-- ELSE -->[[global:guest]]<!-- ENDIF posts.parent.username --></button>
					<!-- ENDIF posts.toPid -->

					<span>
						<!-- IF posts.user.custom_profile_info.length -->
						&#124;
						<!-- BEGIN custom_profile_info -->
						{posts.user.custom_profile_info.content}
						<!-- END custom_profile_info -->
						<!-- ENDIF posts.user.custom_profile_info.length -->
					</span>
				</div>

				<div class="reputation-info">
					[[global:reputation]]: <i class='fa fa-star'></i> <span component="user/reputation" data-reputation="{posts.user.reputation}" data-uid="{posts.uid}" class='formatted-number reputation'>{posts.user.reputation}</span>
				</div>
			</div>
		</div>

		<div class="content" component="post/content" itemprop="text">
			{posts.content}
		</div>

		<small class="visible-xs-inline-block visible-sm-inline-block visible-md-inline-block visible-lg-inline-block date-info pull-left">
			<a class="permalink" style="text-decoration: none" href="{config.relative_path}/post/{posts.pid}"><span class="timeago" title="{posts.timestampISO}"></span></a>

			<i class="fa fa-pencil-square pointer edit-icon <!-- IF !posts.editor.username -->hidden<!-- ENDIF !posts.editor.username -->"></i>

			<small data-editor="{posts.editor.userslug}" component="post/editor" class="hidden">[[global:last_edited_by, {posts.editor.username}]] <span class="timeago" title="{posts.editedISO}"></span></small>

			<!-- IF posts.toPid -->
			<a component="post/parent" class="btn btn-xs btn-default hidden-xs" data-topid="{posts.toPid}" href="/post/{posts.toPid}"><i class="fa fa-reply"></i> @<!-- IF posts.parent.username -->{posts.parent.username}<!-- ELSE -->[[global:guest]]<!-- ENDIF posts.parent.username --></a>
			<!-- ENDIF posts.toPid -->

			<span>
				<!-- IF posts.user.custom_profile_info.length -->
				&#124;
				<!-- BEGIN custom_profile_info -->
				{posts.user.custom_profile_info.content}
				<!-- END custom_profile_info -->
				<!-- ENDIF posts.user.custom_profile_info.length -->
			</span>
		</small>
		<span class="bookmarked"><i class="fa fa-bookmark-o"></i></span>

		<small class="action-info pull-right">
			<!-- IF posts.user.signature -->
			<div component="post/signature" data-uid="{posts.user.uid}" class="post-signature">{posts.user.signature}</div>
			<!-- ENDIF posts.user.signature -->

			<span class="post-tools">
				<a component="post/reply" href="#" class="no-select <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->">[[topic:reply]]</a>
				<a component="post/quote" href="#" class="no-select <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->">[[topic:quote]]</a>
			</span>

			<!-- IMPORT partials/topic/post-menu.tpl -->
		</small>
		<div class="clearfix"></div>
	</div>

<div class="clearfix post-footer">
	<!-- IF posts.user.signature -->
	<div component="post/signature" data-uid="{posts.user.uid}" class="post-signature">{posts.user.signature}</div>
	<!-- ENDIF posts.user.signature -->

	<!-- IF !hideReplies -->
	<a component="post/reply-count" href="#" class="threaded-replies no-select <!-- IF !posts.replies.count -->hidden<!-- ENDIF !posts.replies.count -->">
		<span component="post/reply-count/avatars" class="avatars <!-- IF posts.replies.hasMore -->hasMore<!-- ENDIF posts.replies.hasMore -->">
			<!-- BEGIN posts.replies.users -->
			<!-- IF posts.replies.users.picture -->
			<span><img component="user/picture" data-uid="{posts.replies.users.uid}" title="{posts.replies.users.username}" class="avatar" src="{posts.replies.users.picture}"  itemprop="image" /></span>
			<!-- ELSE -->
			<div component="user/picture" data-uid="{posts.replies.users.uid}" title="{posts.replies.users.username}" class="user-icon" style="background-color: {posts.replies.users.icon:bgColor};">{posts.replies.users.icon:text}</div>
			<!-- ENDIF posts.replies.users.picture -->
			<!-- END posts.replies.users -->
		</span>

		<span class="replies-count" component="post/reply-count/text" data-replies="{posts.replies.count}">{posts.replies.text}</span>
		<span class="replies-last hidden-xs">[[topic:last_reply_time]] <span class="timeago" title="{posts.replies.timestampISO}"></span></span>

		<i class="fa fa-fw fa-chevron-right" component="post/replies/open"></i>
		<i class="fa fa-fw fa-chevron-down hidden" component="post/replies/close"></i>
		<i class="fa fa-fw fa-spin fa-spinner hidden" component="post/replies/loading"></i>
	</a>
	<!-- ENDIF !hideReplies -->
</div>

<hr class="no-space" />
