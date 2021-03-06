/*
Script generated by Aqua Data Studio 4.5.2 on Jun-18-2006 03:45:57 PM
Database: mojo21a
Schema: < All Schema >
Objects: TABLE, SEQUENCE
*/
CREATE TABLE "mp_blogcategories" ( 
	"categoryid"	int4 NOT NULL DEFAULT nextval('"mp_blogcategories_categoryid_seq"'::text),
	"moduleid"  	int4 NOT NULL,
	"category"  	varchar(255) NULL 
	);

CREATE TABLE "mp_blogcomments" ( 
	"blogcommentid"	int4 NOT NULL DEFAULT nextval('"mp_blogcomments_blogcommentid_seq"'::text),
	"moduleid"     	int4 NOT NULL,
	"itemid"       	int4 NOT NULL,
	"comment"      	text NOT NULL,
	"title"        	varchar(100) NULL,
	"name"         	varchar(100) NULL,
	"url"          	varchar(200) NULL,
	"datecreated"  	timestamp NOT NULL DEFAULT ('now'::text)::timestamp(3) with time zone 
	);

CREATE TABLE "mp_blogitemcategories" ( 
	"id"        	int4 NOT NULL DEFAULT nextval('"mp_blogitemcategories_id_seq"'::text),
	"itemid"    	int4 NOT NULL,
	"categoryid"	int4 NOT NULL 
	);

CREATE TABLE "mp_blogs" ( 
	"itemid"        	int4 NOT NULL DEFAULT nextval('"mp_blogs_itemid_seq"'::text),
	"moduleid"      	int4 NOT NULL,
	"createdbyuser" 	varchar(100) NULL,
	"createddate"   	timestamp NULL,
	"title"         	varchar(100) NULL,
	"excerpt"       	varchar(512) NULL,
	"startdate"     	timestamp NULL,
	"isinnewsletter"	bool NULL,
	"includeinfeed" 	bool NULL,
	"description"   	text NULL,
	"commentcount"  	int4 NOT NULL DEFAULT 0,
	"trackbackcount"	int4 NOT NULL DEFAULT 0,
	"category"      	varchar(50) NULL 
	);

CREATE TABLE "mp_blogstats" ( 
	"moduleid"      	int4 NOT NULL,
	"entrycount"    	int4 NOT NULL DEFAULT 0,
	"commentcount"  	int4 NOT NULL DEFAULT 0,
	"trackbackcount"	int4 NOT NULL DEFAULT 0 
	);

CREATE TABLE "mp_calendarevents" ( 
	"itemid"     	int4 NOT NULL DEFAULT nextval('"mp_calendarevents_itemid_seq"'::text),
	"moduleid"   	int4 NOT NULL,
	"title"      	varchar(255) NULL,
	"description"	text NULL,
	"imagename"  	varchar(100) NULL,
	"eventdate"  	timestamp NULL,
	"starttime"  	timestamp NULL,
	"endtime"    	timestamp NULL,
	"createddate"	timestamp NULL,
	"userid"     	int4 NOT NULL DEFAULT 0 
	);

CREATE TABLE "mp_forumposts" ( 
	"postid"        	int4 NOT NULL DEFAULT nextval('"mp_forumposts_postid_seq"'::text),
	"threadid"      	int4 NOT NULL,
	"threadsequence"	int4 NOT NULL DEFAULT 1,
	"subject"       	varchar(255) NOT NULL,
	"postdate"      	timestamp NOT NULL DEFAULT ('now'::text)::timestamp(3) with time zone,
	"approved"      	bool NOT NULL DEFAULT false,
	"userid"        	int4 NOT NULL DEFAULT -1,
	"sortorder"     	int4 NOT NULL DEFAULT 100,
	"post"          	text NOT NULL 
	);

CREATE TABLE "mp_forums" ( 
	"itemid"              	int4 NOT NULL DEFAULT nextval('"mp_forums_itemid_seq"'::text),
	"moduleid"            	int4 NOT NULL,
	"createddate"         	timestamp NOT NULL DEFAULT ('now'::text)::timestamp(3) with time zone,
	"createdby"           	int4 NOT NULL,
	"title"               	varchar(100) NOT NULL,
	"description"         	text NOT NULL,
	"ismoderated"         	bool NOT NULL DEFAULT false,
	"isactive"            	bool NOT NULL DEFAULT true,
	"sortorder"           	int4 NOT NULL DEFAULT 100,
	"threadcount"         	int4 NOT NULL DEFAULT 0,
	"postcount"           	int4 NOT NULL DEFAULT 0,
	"mostrecentpostdate"  	timestamp NULL,
	"mostrecentpostuserid"	int4 NOT NULL DEFAULT -1,
	"postsperpage"        	int4 NOT NULL DEFAULT 10,
	"threadsperpage"      	int4 NOT NULL DEFAULT 40,
	"allowanonymousposts" 	bool NOT NULL DEFAULT true 
	);

CREATE TABLE "mp_forumsubscriptions" ( 
	"subscriptionid" 	int4 NOT NULL DEFAULT nextval('"mp_forumsubscriptions_subscriptionid_seq"'::text),
	"forumid"        	int4 NOT NULL,
	"userid"         	int4 NOT NULL,
	"subscribedate"  	timestamp NOT NULL DEFAULT ('now'::text)::timestamp(3) with time zone,
	"unsubscribedate"	timestamp NULL 
	);

CREATE TABLE "mp_forumthreads" ( 
	"threadid"            	int4 NOT NULL DEFAULT nextval('"mp_forumthreads_threadid_seq"'::text),
	"forumid"             	int4 NOT NULL,
	"threadsubject"       	varchar(255) NOT NULL,
	"threaddate"          	timestamp NOT NULL DEFAULT ('now'::text)::timestamp(3) with time zone,
	"totalviews"          	int4 NOT NULL DEFAULT 0,
	"totalreplies"        	int4 NOT NULL DEFAULT 0,
	"sortorder"           	int4 NOT NULL DEFAULT 1000,
	"islocked"            	bool NOT NULL DEFAULT false,
	"forumsequence"       	int4 NOT NULL DEFAULT 1,
	"mostrecentpostdate"  	timestamp NULL DEFAULT ('now'::text)::timestamp(3) with time zone,
	"mostrecentpostuserid"	int4 NULL,
	"startedbyuserid"     	int4 NOT NULL 
	);

CREATE TABLE "mp_forumthreadsubscriptions" ( 
	"threadsubscriptionid"	int4 NOT NULL DEFAULT nextval('"mp_forumthreadsubscriptions_threadsubscriptionid_seq"'::text),
	"threadid"            	int4 NOT NULL,
	"userid"              	int4 NOT NULL,
	"subscribedate"       	timestamp NOT NULL DEFAULT ('now'::text)::timestamp(3) with time zone,
	"unsubscribedate"     	timestamp NULL 
	);

CREATE TABLE "mp_friendlyurls" ( 
	"urlid"      	int4 NOT NULL DEFAULT nextval('"mp_friendlyurls_urlid_seq"'::text),
	"siteid"     	int4 NOT NULL,
	"friendlyurl"	varchar(255) NULL,
	"realurl"    	varchar(255) NULL,
	"ispattern"  	bool NULL 
	);

CREATE TABLE "mp_galleryimages" ( 
	"itemid"       	int4 NOT NULL DEFAULT nextval('"mp_galleryimages_itemid_seq"'::text),
	"moduleid"     	int4 NOT NULL,
	"displayorder" 	int4 NOT NULL DEFAULT 100,
	"caption"      	varchar(255) NULL,
	"description"  	text NULL,
	"metadataxml"  	text NULL,
	"imagefile"    	varchar(100) NULL,
	"webimagefile" 	varchar(100) NULL,
	"thumbnailfile"	varchar(100) NULL,
	"uploaddate"   	timestamp NOT NULL DEFAULT ('now'::text)::timestamp(3) with time zone,
	"uploaduser"   	varchar(100) NULL 
	);

CREATE TABLE "mp_htmlcontent" ( 
	"itemid"     	int4 NOT NULL DEFAULT nextval('"mp_htmlcontent_itemid_seq"'::text),
	"moduleid"   	int4 NOT NULL,
	"title"      	varchar(255) NULL,
	"excerpt"    	text NULL,
	"body"       	text NOT NULL,
	"morelink"   	varchar(255) NULL,
	"sortorder"  	int4 NOT NULL DEFAULT 500,
	"begindate"  	timestamp NOT NULL DEFAULT '1901-01-01 00:00:00'::timestamp without time zone,
	"enddate"    	timestamp NOT NULL DEFAULT '2200-01-01 00:00:00'::timestamp without time zone,
	"createddate"	timestamp NULL DEFAULT ('now'::text)::timestamp(3) with time zone,
	"userid"     	int4 NULL 
	);

CREATE TABLE "mp_links" ( 
	"itemid"     	int4 NOT NULL DEFAULT nextval('"mp_links_itemid_seq"'::text),
	"moduleid"   	int4 NOT NULL,
	"title"      	varchar(255) NULL,
	"target"     	varchar(20) NULL,
	"url"        	varchar(255) NULL,
	"vieworder"  	int4 NULL,
	"description"	text NULL,
	"createddate"	timestamp NULL,
	"createdby"  	int4 NULL 
	);

CREATE TABLE "mp_moduledefinitions" ( 
	"moduledefid"	int4 NOT NULL DEFAULT nextval('"mp_moduledefinitions_moduledefid_seq"'::text),
	"featurename"	varchar(255) NOT NULL,
	"controlsrc" 	varchar(255) NOT NULL,
	"sortorder"  	int4 NOT NULL DEFAULT 500,
	"isadmin"    	bool NOT NULL DEFAULT false,
	"icon"       	varchar(255) NULL,
	"defaultcachetime"  int4 NOT NULL DEFAULT 0
	);

CREATE TABLE "mp_moduledefinitionsettings" ( 
	"id"                       	int4 NOT NULL DEFAULT nextval('"mp_moduledefinitionsettings_id_seq"'::text),
	"moduledefid"              	int4 NOT NULL,
	"settingname"              	varchar(50) NOT NULL,
	"settingvalue"             	varchar(255) NOT NULL,
	"controltype"              	varchar(50) NULL,
	"regexvalidationexpression"	text NULL 
	);

CREATE TABLE "mp_modules" ( 
	"moduleid"                      	int4 NOT NULL DEFAULT nextval('"mp_modules_moduleid_seq"'::text),
	"moduledefid"                   	int4 NOT NULL,
	"moduletitle"                   	varchar(255) NULL,
	"authorizededitroles"           	text NULL,
	"cachetime"                     	int4 NOT NULL,
	"edituserid"                    	int4 NOT NULL DEFAULT 0,
	"showtitle"                     	bool NULL DEFAULT true,
	"siteid"                        	int4 NOT NULL DEFAULT 0,
	"availableformypage"            	bool NOT NULL DEFAULT false,
	"createdbyuserid"               	int4 NULL,
	"createddate"                   	timestamp NULL,
	"countofuseonmypage"            	int4 NOT NULL DEFAULT 0,
	"icon"                          	varchar(255) NULL,
	"allowmultipleinstancesonmypage"	bool NOT NULL DEFAULT true 
	);

CREATE TABLE "mp_modulesettings" ( 
	"id"                       	int4 NOT NULL DEFAULT nextval('"mp_modulesettings_id_seq"'::text),
	"moduleid"                 	int4 NOT NULL,
	"settingname"              	varchar(50) NOT NULL,
	"settingvalue"             	varchar(255) NOT NULL,
	"controltype"              	varchar(50) NULL,
	"regexvalidationexpression"	text NULL 
	);

CREATE TABLE "mp_pagemodules" ( 
	"pageid"          	int4 NOT NULL,
	"moduleid"        	int4 NOT NULL,
	"panename"        	varchar(50) NULL,
	"moduleorder"     	int4 NOT NULL,
	"publishbegindate"	timestamp NOT NULL,
	"publishenddate"  	timestamp NULL 
	);

CREATE TABLE "mp_pages" ( 
	"pageid"              	int4 NOT NULL DEFAULT nextval('"mp_pages_pageid_seq"'::text),
	"parentid"            	int4 NULL DEFAULT -1,
	"pageorder"           	int4 NOT NULL,
	"siteid"              	int4 NOT NULL,
	"pagename"            	varchar(50) NOT NULL,
	"pagetitle"             varchar(255) NULL,
	"authorizedroles"     	text NULL,
	"editroles"           	text NULL,
	"createchildpageroles"	text NULL,
	"requiressl"          	bool NOT NULL DEFAULT false,
	"allowbrowsercache"     bool NOT NULL DEFAULT true,
	"showbreadcrumbs"     	bool NOT NULL DEFAULT false,
	"pagekeywords"        	varchar(255) NULL,
	"pagedescription"     	varchar(255) NULL,
	"pageencoding"        	varchar(255) NULL,
	"additionalmetatags"  	varchar(255) NULL,
	"menuimage"           	varchar(50) NULL,
	"useurl"              	bool NOT NULL DEFAULT false,
	"url"                 	varchar(255) NULL,
	"openinnewwindow"     	bool NOT NULL DEFAULT false,
	"showchildbreadcrumbs"	bool NOT NULL DEFAULT false,
	"showchildpagemenu"   	bool NOT NULL DEFAULT false,
	"hidemainmenu"        	bool NOT NULL DEFAULT false,
	"skin"                	varchar(100) NULL,
	"includeinmenu"       	bool NOT NULL DEFAULT true 
	);

CREATE TABLE "mp_roles" ( 
	"roleid"     	int4 NOT NULL DEFAULT nextval('"mp_roles_roleid_seq"'::text),
	"siteid"     	int4 NOT NULL,
	"rolename"   	varchar(50) NOT NULL,
	"displayname"	varchar(50) NOT NULL 
	);

CREATE TABLE "mp_rssfeeds" ( 
	"itemid"     	int4 NOT NULL DEFAULT nextval('"mp_rssfeeds_itemid_seq"'::text),
	"moduleid"   	int4 NOT NULL,
	"createddate"	timestamp NOT NULL DEFAULT ('now'::text)::timestamp(3) with time zone,
	"userid"     	int4 NOT NULL DEFAULT 0,
	"author"     	varchar(100) NULL,
	"url"        	varchar(255) NULL,
	"rssurl"     	varchar(255) NULL 
	);

CREATE TABLE "mp_sharedfilefolders" ( 
	"folderid"  	int4 NOT NULL DEFAULT nextval('"mp_sharedfilefolders_folderid_seq"'::text),
	"moduleid"  	int4 NOT NULL,
	"foldername"	varchar(255) NOT NULL,
	"parentid"  	int4 NOT NULL DEFAULT 0 
	);

CREATE TABLE "mp_sharedfiles" ( 
	"itemid"          	int4 NOT NULL DEFAULT nextval('"mp_sharedfiles_itemid_seq"'::text),
	"moduleid"        	int4 NOT NULL,
	"uploaduserid"    	int4 NOT NULL,
	"friendlyname"    	varchar(255) NOT NULL,
	"originalfilename"	varchar(255) NOT NULL,
	"serverfilename"  	varchar(255) NOT NULL,
	"sizeinkb"        	int4 NOT NULL DEFAULT 0,
	"uploaddate"      	timestamp NOT NULL DEFAULT ('now'::text)::timestamp(3) with time zone,
	"folderid"        	int4 NOT NULL DEFAULT 0 
	);

CREATE TABLE "mp_sharedfileshistory" ( 
	"id"              	int4 NOT NULL DEFAULT nextval('"mp_sharedfileshistory_id_seq"'::text),
	"itemid"          	int4 NOT NULL,
	"moduleid"        	int4 NOT NULL,
	"friendlyname"    	varchar(255) NOT NULL,
	"originalfilename"	varchar(255) NULL,
	"serverfilename"  	varchar(50) NOT NULL,
	"sizeinkb"        	int4 NOT NULL DEFAULT 0,
	"uploaddate"      	timestamp NOT NULL,
	"archivedate"     	timestamp NOT NULL DEFAULT ('now'::text)::timestamp(3) with time zone,
	"uploaduserid"    	int4 NOT NULL DEFAULT 0 
	);

CREATE TABLE "mp_sitehosts" ( 
	"hostid"  	int4 NOT NULL DEFAULT nextval('"mp_sitehosts_hostid_seq"'::text),
	"siteid"  	int4 NOT NULL,
	"hostname"	varchar(255) NOT NULL 
	);

CREATE TABLE "mp_sitemoduledefinitions" ( 
	"siteid"         	int4 NOT NULL,
	"moduledefid"    	int4 NOT NULL,
	"authorizedroles"	text NULL 
	);

CREATE TABLE "mp_sitepaths" ( 
	"pathid"     	varchar(36) NOT NULL,
	"siteid"     	int4 NOT NULL,
	"path"       	varchar(255) NOT NULL,
	"loweredpath"	varchar(255) NOT NULL 
	);

CREATE TABLE "mp_sitepersonalizationallusers" ( 
	"pathid"      	varchar(36) NOT NULL,
	"pagesettings"	bytea NOT NULL,
	"lastupdate"  	timestamp NOT NULL 
	);

CREATE TABLE "mp_sitepersonalizationperuser" ( 
	"id"          	varchar(36) NOT NULL,
	"pathid"      	varchar(36) NOT NULL,
	"userid"      	varchar(36) NOT NULL,
	"pagesettings"	bytea NOT NULL,
	"lastupdate"  	timestamp NOT NULL 
	);

CREATE TABLE "mp_sites" ( 
	"siteid"                              	int4 NOT NULL DEFAULT nextval('"mp_sites_siteid_seq"'::text),
	"sitealias"                           	varchar(50) NULL,
	"sitename"                            	varchar(255) NOT NULL,
	"skin"                                	varchar(100) NULL,
	"editorskin"                          	varchar(50) NOT NULL DEFAULT 'normal'::character varying,
	"logo"                                	varchar(50) NULL,
	"icon"                                	varchar(50) NULL,
	"defaultfriendlyurlpatternenum"       	varchar(50) NOT NULL DEFAULT 'PageNameWithDotASPX'::character varying,
	"allowuserskins"                      	bool NOT NULL DEFAULT false,
	"allowpageskins"                      	bool NOT NULL DEFAULT true,
	"allowhidemenuonpages"                	bool NOT NULL DEFAULT true,
	"allownewregistration"                	bool NOT NULL DEFAULT true,
	"usesecureregistration"               	bool NOT NULL DEFAULT false,
	"reallydeleteusers"                   	bool NOT NULL DEFAULT true,
	"allowuserfullnamechange"             	bool NOT NULL DEFAULT false,
	"useemailforlogin"                    	bool NOT NULL DEFAULT true,
	"encryptpasswords"                    	bool NOT NULL DEFAULT false,
	"usesslonallpages"                    	bool NOT NULL DEFAULT false,
	"defaultpagekeywords"                 	varchar(255) NULL,
	"defaultpagedescription"              	varchar(255) NULL,
	"defaultpageencoding"                 	varchar(255) NULL,
	"defaultadditionalmetatags"           	varchar(255) NULL,
	"isserveradminsite"                   	bool NOT NULL DEFAULT false,
	"useldapauth"                         	bool NOT NULL DEFAULT false,
	"autocreateldapuseronfirstlogin"      	bool NOT NULL DEFAULT true,
	"ldapserver"                          	varchar(255) NULL,
	"ldapport"                            	int4 NOT NULL DEFAULT 389,
	"ldapdomain"                          	varchar(255) NULL,
	"ldaprootdn"                          	varchar(255) NULL,
	"ldapuserdnkey"                       	varchar(10) NOT NULL DEFAULT 'uid'::character varying,
	"siteguid"                            	varchar(36) NULL,
	"allowpasswordretrieval"              	bool NOT NULL DEFAULT true,
	"allowpasswordreset"                  	bool NOT NULL DEFAULT true,
	"requiresquestionandanswer"           	bool NOT NULL DEFAULT true,
	"requiresuniqueemail"                 	bool NOT NULL DEFAULT true,
	"maxinvalidpasswordattempts"          	int4 NOT NULL DEFAULT 5,
	"passwordattemptwindowminutes"        	int4 NOT NULL DEFAULT 5,
	"passwordformat"                      	int4 NOT NULL DEFAULT 0,
	"minrequiredpasswordlength"           	int4 NOT NULL DEFAULT 4,
	"minrequirednonalphanumericcharacters"	int4 NOT NULL DEFAULT 0,
	"passwordstrengthregularexpression"   	text NULL,
	"defaultemailfromaddress"             	varchar(100) NULL,
	"enablemypagefeature"                 	bool NOT NULL DEFAULT false 
	);

CREATE TABLE "mp_userpages" ( 
	"userpageid"	varchar(36) NOT NULL,
	"siteid"    	int4 NOT NULL,
	"userguid"  	varchar(36) NOT NULL,
	"pagename"  	varchar(255) NOT NULL,
	"pagepath"  	varchar(255) NOT NULL,
	"pageorder" 	int4 NOT NULL 
	);

CREATE TABLE "mp_userproperties" (
	"propertyid" varchar(36) NOT NULL, 
    "userguid" varchar(36) NOT NULL,
    "propertyname" varchar(255) NULL,
    "propertyvaluestring" text NULL,
    "propertyvaluebinary" bytea NULL,
    "lastupdateddate" date NOT NULL,
    "islazyloaded" bool NOT NULL DEFAULT false
	);
	
CREATE UNIQUE INDEX "mp_userproperties_pkey"
  ON "mp_userproperties"("propertyid"); 

CREATE TABLE "mp_userroles" ( 
	"id"    	int4 NOT NULL DEFAULT nextval('"mp_userroles_id_seq"'::text),
	"userid"	int4 NOT NULL,
	"roleid"	int4 NOT NULL 
	);

CREATE TABLE "mp_users" ( 
	"userid"                                	int4 NOT NULL DEFAULT nextval('"mp_users_userid_seq"'::text),
	"siteid"                                	int4 NOT NULL,
	"name"                                  	varchar(50) NOT NULL,
	"email"                                 	varchar(100) NOT NULL,
	"loginname"                             	varchar(50) NULL,
	"password"                              	varchar(50) NOT NULL,
	"gender"                                	char(1) NULL,
	"profileapproved"                       	bool NOT NULL DEFAULT true,
	"approvedforforums"                     	bool NOT NULL DEFAULT true,
	"trusted"                               	bool NOT NULL DEFAULT false,
	"displayinmemberlist"                   	bool NULL DEFAULT true,
	"websiteurl"                            	varchar(100) NULL,
	"country"                               	varchar(100) NULL,
	"state"                                 	varchar(100) NULL,
	"occupation"                            	varchar(100) NULL,
	"interests"                             	varchar(100) NULL,
	"msn"                                   	varchar(50) NULL,
	"yahoo"                                 	varchar(50) NULL,
	"aim"                                   	varchar(50) NULL,
	"icq"                                   	varchar(50) NULL,
	"totalposts"                            	int4 NOT NULL DEFAULT 0,
	"avatarurl"                             	varchar(255) NULL DEFAULT 'blank.gif'::character varying,
	"timeoffsethours"                       	int4 NOT NULL DEFAULT 0,
	"signature"                             	varchar(255) NULL,
	"datecreated"                           	timestamp NOT NULL DEFAULT ('now'::text)::timestamp(3) with time zone,
	"userguid"                              	char(36) NULL,
	"skin"                                  	varchar(100) NULL,
	"isdeleted"                             	bool NOT NULL DEFAULT false,
	"loweredemail"                          	varchar(100) NULL,
	"passwordquestion"                      	varchar(255) NULL,
	"passwordanswer"                        	varchar(255) NULL,
	"lastactivitydate"                      	timestamp NULL,
	"lastlogindate"                         	timestamp NULL,
	"lastpasswordchangeddate"               	timestamp NULL,
	"lastlockoutdate"                       	timestamp NULL,
	"failedpasswordattemptwindowstart"      	timestamp NULL,
	"failedpasswordanswerattemptwindowstart"	timestamp NULL,
	"islockedout"                           	bool NOT NULL DEFAULT false,
	"failedpasswordattemptcount"            	int4 NOT NULL DEFAULT 0,
	"failedpasswordanswerattemptcount"      	int4 NOT NULL DEFAULT 0,
	"mobilepin"                             	varchar(16) NULL,
	"passwordsalt"                          	varchar(128) NULL,
	"comment"                               	text NULL,
	"registerconfirmguid"                   	varchar(36) NULL DEFAULT '00000000-0000-0000-0000-000000000000'::character varying 
	);

CREATE TABLE "mp_webparts" ( 
	"webpartid"                     	varchar(36) NOT NULL,
	"siteid"                        	int4 NOT NULL,
	"title"                         	varchar(255) NOT NULL,
	"description"                   	varchar(255) NOT NULL,
	"imageurl"                      	varchar(255) NULL,
	"classname"                     	varchar(255) NOT NULL,
	"assemblyname"                  	varchar(255) NOT NULL,
	"availableformypage"            	bool NOT NULL DEFAULT false,
	"allowmultipleinstancesonmypage"	bool NOT NULL DEFAULT true,
	"availableforcontentsystem"     	bool NOT NULL DEFAULT false,
	"countofuseonmypage"            	int4 NOT NULL DEFAULT 0 
	);

CREATE SEQUENCE "mp_blogcomments_blogcommentid_seq";

CREATE SEQUENCE "mp_blogs_itemid_seq";

CREATE SEQUENCE "mp_forumposts_postid_seq";

CREATE SEQUENCE "mp_forums_itemid_seq";

CREATE SEQUENCE "mp_forumthreads_threadid_seq";

CREATE SEQUENCE "mp_forumthreadsubscriptions_threadsubscriptionid_seq";

CREATE SEQUENCE "mp_forumsubscriptions_subscriptionid_seq";

CREATE SEQUENCE "mp_galleryimages_itemid_seq";

CREATE SEQUENCE "mp_htmlcontent_itemid_seq";

CREATE SEQUENCE "mp_links_itemid_seq";

CREATE SEQUENCE "mp_moduledefinitions_moduledefid_seq";

CREATE SEQUENCE "mp_moduledefinitionsettings_id_seq";

CREATE SEQUENCE "mp_modules_moduleid_seq";

CREATE SEQUENCE "mp_modulesettings_id_seq";

CREATE SEQUENCE "mp_pages_pageid_seq";

CREATE SEQUENCE "mp_roles_roleid_seq";

CREATE SEQUENCE "mp_sharedfilefolders_folderid_seq";

CREATE SEQUENCE "mp_sharedfiles_itemid_seq";

CREATE SEQUENCE "mp_sharedfileshistory_id_seq";

CREATE SEQUENCE "mp_sitehosts_hostid_seq";

CREATE SEQUENCE "mp_sites_siteid_seq";

CREATE SEQUENCE "mp_userroles_id_seq";

CREATE SEQUENCE "mp_users_userid_seq";

CREATE SEQUENCE "mp_rssfeeds_itemid_seq";

CREATE SEQUENCE "mp_calendarevents_itemid_seq";

CREATE SEQUENCE "mp_friendlyurls_urlid_seq";

CREATE SEQUENCE "mp_blogcategories_categoryid_seq";

CREATE SEQUENCE "mp_blogitemcategories_id_seq";


CREATE UNIQUE INDEX "mp_blogcategories_pkey"
	ON "mp_blogcategories"("categoryid");

CREATE UNIQUE INDEX "mp_blogcategories_idxurlid_categoryidx"
	ON "mp_blogcategories"("categoryid");

CREATE UNIQUE INDEX "mp_blogcomments_pkey"
	ON "mp_blogcomments"("blogcommentid");

CREATE UNIQUE INDEX "mp_blogitemcategories_idxid_idx"
	ON "mp_blogitemcategories"("id");

CREATE UNIQUE INDEX "mp_blogitemcategories_pkey"
	ON "mp_blogitemcategories"("id");

CREATE UNIQUE INDEX "mp_blogs_pkey"
	ON "mp_blogs"("itemid");

CREATE UNIQUE INDEX "mp_calendarevents_idxitemid_idx"
	ON "mp_calendarevents"("itemid");

CREATE UNIQUE INDEX "mp_calendarevents_pkey"
	ON "mp_calendarevents"("itemid");

CREATE UNIQUE INDEX "mp_forumposts_pkey"
	ON "mp_forumposts"("postid");

CREATE UNIQUE INDEX "mp_forums_pkey"
	ON "mp_forums"("itemid");

CREATE UNIQUE INDEX "mp_forumsubscriptions_pkey"
	ON "mp_forumsubscriptions"("subscriptionid");

CREATE UNIQUE INDEX "mp_forumthreads_pkey"
	ON "mp_forumthreads"("threadid");

CREATE UNIQUE INDEX "mp_forumthreadsubscriptions_pkey"
	ON "mp_forumthreadsubscriptions"("threadsubscriptionid");

CREATE UNIQUE INDEX "mp_friendlyurls_idxurlid_idx"
	ON "mp_friendlyurls"("urlid");

CREATE UNIQUE INDEX "mp_friendlyurls_pkey"
	ON "mp_friendlyurls"("urlid");

CREATE INDEX "mp_friendlyurls_idxfriendlyurl_idx"
	ON "mp_friendlyurls"("friendlyurl");

CREATE UNIQUE INDEX "mp_galleryimages_pkey"
	ON "mp_galleryimages"("itemid");

CREATE UNIQUE INDEX "mp_htmlcontent_pkey"
	ON "mp_htmlcontent"("itemid");

CREATE UNIQUE INDEX "mp_links_pkey"
	ON "mp_links"("itemid");

CREATE UNIQUE INDEX "mp_moduledefinitions_pkey"
	ON "mp_moduledefinitions"("moduledefid");

CREATE UNIQUE INDEX "mp_moduledefinitionsettings_pkey"
	ON "mp_moduledefinitionsettings"("moduledefid", "settingname");

CREATE UNIQUE INDEX "mp_modules_pkey"
	ON "mp_modules"("moduleid");

CREATE INDEX "mp_modulesettings_ix_modul-0"
	ON "mp_modulesettings"("moduleid", "settingname");

CREATE UNIQUE INDEX "mp_pagemodules_pkey"
	ON "mp_pagemodules"("pageid", "moduleid");

CREATE UNIQUE INDEX "mp_pages_pkey"
	ON "mp_pages"("pageid");

CREATE INDEX "mp_roles_idxroleid_idx"
	ON "mp_roles"("roleid");

CREATE INDEX "mp_roles_idxsiteidroleid_idx"
	ON "mp_roles"("roleid", "siteid");

CREATE INDEX "mp_roles_idxsiteid_idx"
	ON "mp_roles"("siteid");

CREATE UNIQUE INDEX "mp_roles_pkey"
	ON "mp_roles"("roleid");

CREATE UNIQUE INDEX "mp_rssfeeds_pkey"
	ON "mp_rssfeeds"("itemid");

CREATE UNIQUE INDEX "mp_rssfeeds_idxitemid_idx"
	ON "mp_rssfeeds"("itemid");

CREATE UNIQUE INDEX "mp_sharedfilefolders_pkey"
	ON "mp_sharedfilefolders"("folderid");

CREATE UNIQUE INDEX "mp_sharedfiles_pkey"
	ON "mp_sharedfiles"("itemid");

CREATE UNIQUE INDEX "mp_sharedfileshistory_pkey"
	ON "mp_sharedfileshistory"("id");

CREATE UNIQUE INDEX "mp_sitehosts_pkey"
	ON "mp_sitehosts"("hostid");

CREATE UNIQUE INDEX "mp_sitehosts_idxhostname_idx"
	ON "mp_sitehosts"("hostname");

CREATE UNIQUE INDEX "mp_sitemoduledefinitions_pkey"
	ON "mp_sitemoduledefinitions"("siteid", "moduledefid");

CREATE UNIQUE INDEX "mp_sitepaths_idxpthid_idx"
	ON "mp_sitepaths"("pathid");

CREATE UNIQUE INDEX "mp_sitepersonalizationallusers_idxpthid_idx"
	ON "mp_sitepersonalizationallusers"("pathid");

CREATE UNIQUE INDEX "mp_sitepersonalizationperuser_idxid_idx"
	ON "mp_sitepersonalizationperuser"("id");

CREATE UNIQUE INDEX "mp_sites_pkey"
	ON "mp_sites"("siteid");

CREATE UNIQUE INDEX "mp_userpages_pkey"
	ON "mp_userpages"("userpageid");

CREATE INDEX "mp_users_idxemail_idx"
	ON "mp_users"("email");

CREATE UNIQUE INDEX "mp_users_pkey"
	ON "mp_users"("userid");

CREATE INDEX "mp_users_idxname_idx"
	ON "mp_users"("name");

CREATE UNIQUE INDEX "mp_webparts_pkey"
	ON "mp_webparts"("webpartid");


ALTER TABLE "mp_calendarevents"
	ADD CONSTRAINT "fk_calendarevents_modules_fk"
	FOREIGN KEY("moduleid")
	REFERENCES "public"."mp_modules"("moduleid");

ALTER TABLE "mp_htmlcontent"
	ADD CONSTRAINT "fk_htmltext_modules_fk"
	FOREIGN KEY("moduleid")
	REFERENCES "public"."mp_modules"("moduleid");

ALTER TABLE "mp_links"
	ADD CONSTRAINT "fk_links_modules_fk"
	FOREIGN KEY("moduleid")
	REFERENCES "public"."mp_modules"("moduleid");
	


ALTER TABLE "mp_modules"
	ADD CONSTRAINT "fk_modules_moduledefinitions_fk"
	FOREIGN KEY("moduledefid")
	REFERENCES "public"."mp_moduledefinitions"("moduledefid");

ALTER TABLE "mp_modulesettings"
	ADD CONSTRAINT "fk_modulesettings_modules_fk"
	FOREIGN KEY("moduleid")
	REFERENCES "public"."mp_modules"("moduleid");

ALTER TABLE "mp_pages"
	ADD CONSTRAINT "fk_tabs_portals_fk"
	FOREIGN KEY("siteid")
	REFERENCES "public"."mp_sites"("siteid");

ALTER TABLE "mp_roles"
	ADD CONSTRAINT "fk_roles_portals_fk"
	FOREIGN KEY("siteid")
	REFERENCES "public"."mp_sites"("siteid");


ALTER TABLE "mp_rssfeeds"
	ADD CONSTRAINT "fk_rssfeeds_modules_fk"
	FOREIGN KEY("moduleid")
	REFERENCES "public"."mp_modules"("moduleid");

	

CREATE TABLE "mp_schemaversion" (
 "applicationid" varchar(36) NOT NULL, 
 "applicationname" varchar(255) NOT NULL,
  "major" int4 NOT NULL DEFAULT 0,
  "minor" int4 NOT NULL DEFAULT 0,
  "build" int4 NOT NULL DEFAULT 0,
  "revision" int4 NOT NULL DEFAULT 0
	);
	
CREATE UNIQUE INDEX "mp_schemaversion_pkey"
  ON "mp_schemaversion"("applicationid");  
  
  
  
  CREATE SEQUENCE "mp_schemascripthistoryid_seq";
  
  CREATE TABLE "mp_schemascripthistory" (
  	"id" int4 NOT NULL DEFAULT nextval('"mp_schemascripthistoryid_seq"'::text), 
      "applicationid" varchar(36) NOT NULL,
      "scriptfile" varchar(255) NOT NULL,
      "runtime" timestamp NOT NULL,
      "erroroccurred" bool NOT NULL,
      "errormessage" text NULL,
      "scriptbody" text NULL
  	);
  	
  CREATE UNIQUE INDEX "mp_schemascripthistory_pkey"
  ON "mp_schemascripthistory"("id");   
  
  
	

	
/*
	
CREATE TABLE "mp_privatemessages" (
	"messageid" varchar(36) NOT NULL, 
    "fromuser" varchar(36) NOT NULL,
    "priorityid" varchar(36) NULL,
    "subject" varchar(255) NOT NULL,
    "body" text NOT NULL,
    "tocsvlist" text NULL,
    "cccsvlist" text NULL,
    "bcccsvlist" text NULL,
    "tocsvlabels" text NULL,
    "cccsvlabels" text NULL,
    "bcccsvlabels" text NULL,
    "createddate" date NOT NULL,
    "sentdate" date NULL
	);
	
CREATE UNIQUE INDEX "mp_privatemessages_pkey"
  ON "mp_privatemessages"("messageid");  
  
  
  
 CREATE TABLE "mp_privatemessagepriority" (
 	"priorityid" varchar(36) NOT NULL, 
     "priority" varchar(50) NOT NULL
 	);
 	
 CREATE UNIQUE INDEX "mp_privatemessagepriority_pkey"
  ON "mp_privatemessagepriority"("priorityid");
  
  CREATE TABLE "mp_privatemessageattachments" (
  	"attachmentid" varchar(36) NOT NULL, 
      "messageid" varchar(36) NOT NULL,
      "originalfilename" varchar(255) NOT NULL,
      "serverfilename" varchar(50) NOT NULL,
      "createddate" date NOT NULL
  	);
  	
  CREATE UNIQUE INDEX "mp_privatemessageattachments_pkey"
  ON "mp_privatemessageattachments"("attachmentid"); 
  
  */
  
  
  

