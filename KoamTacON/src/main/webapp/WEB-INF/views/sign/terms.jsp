<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- global header -->
<%@ include file="../include/gheader.jsp"%>

<!DOCTYPE HTML>
<!--
    Editorial by HTML5 UP
    html5up.net | @ajlkn
    Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Sign in - KoamTacON</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]><script src="<c:url value='/resources/assets/js/ie/html5shiv.js' />"></script><![endif]-->
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/main.css' />" />
<!--[if lte IE 9]><link rel="stylesheet" href="<c:url value='/resources/assets/css/ie9.css' />" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="<c:url value='/resources/assets/css/ie8.css' />" /><![endif]-->

<!-- Scripts -->
<%@ include file="../include/incScripts.jsp"%>
<!-- <link href="/resources/fullcalendar/main.css" rel='stylesheet' />
<script src="/resources/fullcalendar/main.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var srcCalendarEl1 = document.getElementById('source-calendar1');
		var srcCalendarEl2 = document.getElementById('source-calendar2');
		var srcCalendarEl3 = document.getElementById('source-calendar3');
		var srcCalendarEl4 = document.getElementById('source-calendar4');
		var srcCalendarEl5 = document.getElementById('source-calendar5');
		var srcCalendarEl6 = document.getElementById('source-calendar6');
		var srcCalendarEl7 = document.getElementById('source-calendar7');
		var srcCalendarEl8 = document.getElementById('source-calendar8');
		var srcCalendarEl9 = document.getElementById('source-calendar9');
		var srcCalendarEl10 = document.getElementById('source-calendar10');
		var srcCalendarEl11 = document.getElementById('source-calendar11');
		var srcCalendarEl12 = document.getElementById('source-calendar12');
		/* 	var destCalendarEl = document.getElementById('destination-calendar'); */

		var srcCalendar1 = new FullCalendar.Calendar(srcCalendarEl1, {
			headerToolbar : {
				/* 			left : 'hide', */
				/* 	center : 'title', */
				right : false
			},
			editable : true,
			initialDate : '2020-01-01',
			events : [ {
				title : 'event1',
				start : '2020-01-01',
				end : '2020-01-05'
			}, {
				title : 'event2',
				start : '2020-01-11T10:00:00',
				end : '2020-01-20T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});

		var srcCalendar2 = new FullCalendar.Calendar(srcCalendarEl2, {
			headerToolbar : {
				right : false
			},
			editable : true,
			initialDate : '2020-02-01',
			events : [ {
				title : 'event1',
				start : '2020-09-11',
				end : '2020-09-16'
			}, {
				title : 'event2',
				start : '2020-09-13T10:00:00',
				end : '2020-09-13T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});

		var srcCalendar3 = new FullCalendar.Calendar(srcCalendarEl3, {
			headerToolbar : {
				right : false
			},
			editable : true,
			initialDate : '2020-03-01',
			events : [ {
				title : 'event1',
				start : '2020-09-11',
				end : '2020-09-16'
			}, {
				title : 'event2',
				start : '2020-09-13T10:00:00',
				end : '2020-09-13T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});
		var srcCalendar4 = new FullCalendar.Calendar(srcCalendarEl4, {
			headerToolbar : {
				right : false
			},
			editable : true,
			initialDate : '2020-04-12',
			events : [ {
				title : 'event1',
				start : '2020-09-11',
				end : '2020-09-16'
			}, {
				title : 'event2',
				start : '2020-09-13T10:00:00',
				end : '2020-09-13T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});
		var srcCalendar5 = new FullCalendar.Calendar(srcCalendarEl5, {
			headerToolbar : {
				right : false
			},
			editable : true,
			initialDate : '2020-05-12',
			events : [ {
				title : 'event1',
				start : '2020-09-11',
				end : '2020-09-16'
			}, {
				title : 'event2',
				start : '2020-09-13T10:00:00',
				end : '2020-09-13T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});

		var srcCalendar6 = new FullCalendar.Calendar(srcCalendarEl6, {
			headerToolbar : {
				right : false
			},
			editable : true,
			initialDate : '2020-06-12',
			events : [ {
				title : 'event1',
				start : '2020-09-11',
				end : '2020-09-16'
			}, {
				title : 'event2',
				start : '2020-09-13T10:00:00',
				end : '2020-09-13T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});

		var srcCalendar7 = new FullCalendar.Calendar(srcCalendarEl7, {
			headerToolbar : {
				right : false
			},
			editable : true,
			initialDate : '2020-07-12',
			events : [ {
				title : 'event1',
				start : '2020-09-11',
				end : '2020-09-16'
			}, {
				title : 'event2',
				start : '2020-09-13T10:00:00',
				end : '2020-09-13T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});

		var srcCalendar8 = new FullCalendar.Calendar(srcCalendarEl8, {
			headerToolbar : {
				right : false
			},
			editable : true,
			initialDate : '2020-08-12',
			events : [ {
				title : 'event1',
				start : '2020-09-11',
				end : '2020-09-16'
			}, {
				title : 'event2',
				start : '2020-09-13T10:00:00',
				end : '2020-09-13T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});

		var srcCalendar9 = new FullCalendar.Calendar(srcCalendarEl9, {
			headerToolbar : {
				right : false
			},
			editable : true,
			initialDate : '2020-09-12',
			events : [ {
				title : 'event1',
				start : '2020-09-11',
				end : '2020-09-16'
			}, {
				title : 'event2',
				start : '2020-09-13T10:00:00',
				end : '2020-09-13T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});

		var srcCalendar10 = new FullCalendar.Calendar(srcCalendarEl10, {
			headerToolbar : {
				right : false
			},
			editable : true,
			initialDate : '2020-10-12',
			events : [ {
				title : 'event1',
				start : '2020-09-11',
				end : '2020-09-16'
			}, {
				title : 'event2',
				start : '2020-09-13T10:00:00',
				end : '2020-09-13T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});

		var srcCalendar11 = new FullCalendar.Calendar(srcCalendarEl11, {
			headerToolbar : {
				right : false
			},
			editable : true,
			initialDate : '2020-11-12',
			events : [ {
				title : 'event1',
				start : '2020-09-11',
				end : '2020-09-16'
			}, {
				title : 'event2',
				start : '2020-09-13T10:00:00',
				end : '2020-09-13T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});

		var srcCalendar12 = new FullCalendar.Calendar(srcCalendarEl12, {
			headerToolbar : {
				right : false
			},
			editable : true,
			initialDate : '2020-12-12',
			events : [ {
				title : 'event1',
				start : '2020-09-11',
				end : '2020-09-16'
			}, {
				title : 'event2',
				start : '2020-09-13T10:00:00',
				end : '2020-09-13T16:00:00'
			} ],
			eventLeave : function(info) {
				console.log('event left!', info.event);
			}
		});
		/* var destCalendar = new FullCalendar.Calendar(destCalendarEl, {
			initialDate : '2020-09-12',
			editable : true,
			droppable : true, // will let it receive events!
			eventReceive : function(info) {
				console.log('event received!', info.event);
			}
		}); */

		srcCalendar1.render();
		srcCalendar2.render();
		srcCalendar3.render();
		srcCalendar4.render();
		srcCalendar5.render();
		srcCalendar6.render();
		srcCalendar7.render();
		srcCalendar8.render();
		srcCalendar9.render();
		srcCalendar10.render();
		srcCalendar11.render();
		srcCalendar12.render();

		/* destCalendar.render(); */

	});
</script> -->
<!-- <style>
/* bodys {
	margin: 20px 0 0 20px;
	font-size: 12px;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
} */
mains {
	display: flex;
}

aside {
	flex-grow: 3;
	width: 10px;
	margin: 20px 0 0 20px;
	font-size: 12px;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
}

section {
	flex-grow: 3;
	width: 1000px;

	/* height: 1200px; */
}

#source-calendar1, #destination-calendar, #source-calendar2,
	#source-calendar3, #source-calendar4, #source-calendar5,
	#source-calendar6, #source-calendar7, #source-calendar8,
	#source-calendar9, #source-calendar10, #source-calendar11,
	#source-calendar12 {
	position: left;
	float: left;
	width: 300px;
	margin: 0 0px 50px 0;
}
</style> -->
</head>

<body>
	<div id="wrapper">
		<div id="main">
			<%@ include file="../include/header.jsp"%>
			<div class="inner">
			<!-- 	<mains> -->
				<!-- <aside>

					<div id='source-calendar1'></div>
					<div id='source-calendar2'></div>
					<div id='source-calendar3'></div>
					<div id='source-calendar4'></div>
					<div id='source-calendar5'></div>
					<div id='source-calendar6'></div>
					<div id='source-calendar7'></div>
					<div id='source-calendar8'></div>
					<div id='source-calendar9'></div>
					<div id='source-calendar10'></div>
					<div id='source-calendar11'></div>
					<div id='source-calendar12'></div>

				</aside> -->
				<section>
					<header class="main">
						<h2>연수원 이용규정</h2>
					</header>
					<h3>Application Service Provider Agreement</h3>

					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This
						Agreement is made and entered into by and between KOAMTAC, INC., a
						NEW JERSEY corporation (hereafter “KOAMTAC”) and CUSTOMER, whether
						an individual user or a corporate user (collectively alternatively
						referred to throughout as “Subscriber”). This Agreement
						("Agreement") is effective as of the date CUSTOMER clicks to
						accept the Agreement (the "Effective Date"). If you are accepting
						on behalf of CUSTOMER, you represent and warrant that: (i) you
						have full legal authority to bind CUSTOMER to this Agreement; (ii)
						you have read and understand this Agreement; and (iii) you agree,
						on behalf of CUSTOMER, to this Agreement. If you do not have the
						legal authority to bind CUSTOMER, please do not click to accept.
						This Agreement governs CUSTOMER 's access to and use of the
						Service. For an offline variant of this Agreement, you may contact
						KOAMTAC for more information.</p>
					<h3>RECITALS</h3>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A. KOAMTAC
						is in the business of providing a software application online,
						known as “KOAMTACON”, alternatively referred to throughout as
						“Service” or the "Services";</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B.
						Subscriber is an individual and/or an organization, also termed
						herein as CUSTOMER, that desires to use a particular KOAMTAC
						application, titled KOAMTACON, on the terms and conditions set
						forth in this Agreement;</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NOW,
						THEREFORE, Subscriber ("CUSTOMER") and KOAMTAC, collectively the
						"Parties", agree as follows:</p>

					<h3>AGREEMENT</h3>
					<h4>Section 1. Definitions</h4>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Whenever
						used in this Agreement with initial letters capitalized, the
						following terms will have the following meanings:</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>“KOAMTACON”</b>
						means KOAMTAC proprietary online software application identified
						thereby, as accessed online via a portal or Administrative Console
						(hereafter "Admin Console").
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>“Start
							Date”</b> means the date on which access to KOAMTACON will commence
						by Subscriber.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>“CUSTOMER(S)”</b>
						means individual Subscribers and/or those employees/agents of a
						corporate Subscriber who will have access to KOAMTACON.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>“Term”</b> has
						the meaning given to it in Section 5.1.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>"Admin
							Console"</b> means the Administrative Console that provides access to
						KOAMTCON and/or provides utilization of KOAMTCON functionality.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>"Customer
							Data"</b> means any and all data owned or possessed by CUSTOMER that
						is shared with KOAMTAC via use of KOAMTCON.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>"Application(s)
							and Project(s)"</b> means any and all applications and/or projects,
						generated, owned or possessed by CUSTOMER that are related to the
						CUSTOMER use of KOAMTCON.
					</p>

					<h4>Section 2. Application Software Services</h4>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>2.1 Scope.</b>
						Provided that CUSTOMER remains in compliance with this Agreement,
						any KOMATAC Acceptable Use Provisions (AUP), and applicable law,
						KOAMTAC will, commencing on the Start Date, permit CUSTOMER to
						have access to and use KOAMTACON via the Admin Console.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>2.2
							Compliance with Laws.</b> In its performance of this Agreement, both
						parties agree to comply with all applicable laws, rules,
						regulations and orders of governmental authorities having
						jurisdiction.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>2.3 No
							Additional Representations.</b> CUSTOMER shall not make any
						representations, warranties or guarantees concerning KOAMTACON and
						KOAMTAC services and shall refrain from making any false or
						misleading statements regarding the same.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>2.4 Use of
							Subscriber Name and Logo; Press Releases.</b> Subscriber hereby
						grants KOAMTAC a non-exclusive right to use CUSTOMER'S name and
						logo to identify CUSTOMER as a customer of KOAMTACON on or in
						connection with any KOAMTAC web site, promotional and marketing
						and securities materials. Other than as provided above, KOAMTAC
						shall not identify or refer to CUSTOMER in any materials without
						CUSTOMER'S prior written consent, which shall not be unreasonably
						withheld.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>2.5 Access
							to System.</b> Access to KOAMTACON by each CUSTOMER shall require the
						use of a password that will be automatically generated by
						KOAMTACON and may be changed by the CUSTOMER from time to time.
						CUSTOMER is fully responsible and liable for all activities that
						occur under any such password issued to a CUSTOMER. CUSTOMER
						agrees to notify KOAMTAC immediately of any unauthorized use of
						any CUSTOMER password or any other breach of security known to
						CUSTOMER.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>2.6
							Equipment.</b> CUSTOMER is solely responsible for providing and
						maintaining at its own expense all equipment, facilities and
						services necessary to access and use KOAMTACON, including, without
						limitation, computer hardware and software, modems, telephone
						service and Internet access.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>2.7
							Facilities and Services.</b> KOAMTAC may process and store an
						Application and Customer Data in the United States or any other
						country in which KOAMTAC or its agents maintain facilities. By
						using the Services, CUSTOMER consents to this processing and
						storage of an Application and Customer Data. Under this Agreement,
						KOAMTAC is merely a data processor.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>2.8
							Disclosure for EU Customers.</b> For any CUSTOMER electronically
						and/or physically based in the EU, note that KOAMTAC does not
						accept CUSTOMERS whose primary place of business, or access of
						KOAMTACON emanates from any country within the EU ("EU
						Customer(s)"). By agreeing to the terms herein and by using
						KOAMTCON services, you hereby warrant that you are not an EU
						Customer. Should you later become an EU Customer while using
						KOAMTACON, you hereby agree to notify KOMATAC and discontinue use
						of KOAMTACON. Failure to abide by the same shall be deemed a
						Breach as defined under Section 5.2 hereafter.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>2.9
							Performance.</b> KOAMTAC will use commercially reasonable efforts to
						ensure that KOAMTACON is fully operational and accessible by
						CUSTOMER at least 90% of the time measured on a monthly basis,
						except for scheduled maintenance, and except for any loss or
						interruption of service due to causes beyond the reasonable
						control of KOAMTAC or that are not reasonably foreseeable by
						KOAMTAC, including, but not limited to, interruption or failure of
						telecommunications or digital transmission links and Internet
						slowdowns or failures. If KOAMTAC fails to meets its obligations
						under this Section, CUSTOMER’S sole and exclusive remedy shall be
						a credit against future Fees equal to a pro rata portion of the
						Fees for the period of the downtime.
					</p>

					<h4>Section 3. Compensation</h4>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>3.1 Fees.</b>
						Subscription fees for each month of the Term will be as set forth
						in Exhibit A hereto under the heading “Fees.”
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>3.2 Failure
							of Payment.</b> In addition to other remedies available to KOAMTAC,
						any payment not received by KOAMTAC when due will bear interest at
						the lesser of 1.5% per month or the maximum rate allowed by law
						from the date due until paid. In addition, failure of CUSTOMER to
						pay any amounts due within thirty (30) days of the invoice date
						shall be deemed a material breach of this Agreement, justifying
						suspension of CUSTOMER’S access to KOAMTACON, and will be
						sufficient cause for termination of this Agreement. Any such
						suspension does not relieve CUSTOMER from paying any past due
						amounts plus interest.
					</p>

					<h4>Section 4. Customer Service</h4>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;KOAMTAC will
						make e-mail and telephone customer support available to the
						Subscriber for KOAMTACON technical matters upon request according
						to commercially reasonable terms. Notwithstanding, CUSTOMER is
						responsible for technical support of Customer Data, and its
						Application(s) and Project(s).</p>

					<h4>Section 5. Term and Termination</h4>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>5.1 Term.</b>
						The “Term” of this Agreement will begin on the Effective Date and
						continue until the Agreement is terminated as set forth in Section
						5 of this Agreement.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>5.2
							Termination for Breach.</b> Either party may terminate this Agreement
						for breach if: (i) the other party is in material breach of the
						Agreement and fails to cure that breach within thirty days after
						receipt of written notice; (ii) the other party ceases its
						business operations or becomes subject to insolvency proceedings
						and the proceedings are not dismissed within ninety days; or (iii)
						the other party is in material breach of this Agreement more than
						two times notwithstanding any cure of such breaches. In addition,
						KOAMTAC may terminate any, all, or any portion of the Services or
						Projects, if CUSTOMER meets any of the conditions in Sections 2.8,
						5.2 and 5.3.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>5.3
							Termination for Inactivity.</b> KOAMTAC reserves the right to
						terminate the Services for inactivity, if, for a period exceeding
						180 days, CUSTOMER: (a) has failed to access the Admin Console;
						(b) a Project has no active virtual machine or storage resources
						or an Application has not served any requests; and (c) no
						electronic bills are being generated.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>5.4
							Termination for Convenience.</b> CUSTOMER may stop using the Services
						at any time. CUSTOMER may terminate this Agreement for its
						convenience at any time on prior written notice and upon
						termination, must cease use of the applicable Services. KOAMTAC
						may terminate this Agreement for its convenience at any time
						without liability to CUSTOMER. Subject to Section 7, KOAMTAC may
						discontinue any Services or any portion or feature for any reason
						at any time without liability to CUSTOMER.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>5.5 Effect
							of Termination.</b> If the Agreement is terminated, then: (i) the
						rights granted by one party to the other will immediately cease;
						(ii) all Fees (including Taxes) owed by CUSTOMER to KOAMTAC are
						immediately due upon receipt of the final bill; (iii) CUSTOMER
						will delete the Software and any Application; and (iv) upon
						request, each party will use commercially reasonable efforts to
						return or destroy all Confidential Information of the other party.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>5.6
							Survival.</b> The provisions of this Agreement that may reasonably be
						interpreted or construed as surviving termination of this
						Agreement will so survive.
					</p>

					<h4>Section 6. Proprietary Rights</h4>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>6.1 KOAMTAC
							Rights.</b> As between the parties, KOAMTAC will have and retain all
						title and ownership of, and intellectual property and other rights
						in and to, KOAMTACON and all materials utilized or developed by
						KOAMTAC in connection with this Agreement. No intellectual
						property right (including without limitation all copyrights,
						database structure and organization, specific sets of information
						extracted therefrom, non-public data, and specifics about the
						means and standards of KOAMTACON) shall vest in or be transferred
						to Subscriber. Subscriber acknowledges that KOAMTAC treats all
						KOAMTACON as KOAMTAC confidential information. Subscriber agrees
						to conform to this treatment and to protect and preserve KOAMTACON
						from unauthorized use or disclosure. Subscriber acknowledges that
						unauthorized disclosure or use of KOAMTACON could cause
						irreparable harm to KOAMTAC for which monetary damages may be
						difficult to ascertain. Subscriber agrees that KOAMTAC shall have
						the right, in addition to its other rights and remedies, to seek
						and obtain injunctive relief for or to prevent such unauthorized
						disclosure or uses, and/or to limit any improper benefits derived
						therefrom, without the necessity of posting a bond or other
						security.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>6.2
							Reservation.</b> KOAMTAC reserves any rights not expressly granted to
						CUSTOMER in this Agreement. Any use of KOAMTACON not expressly
						authorized by this Agreement is strictly prohibited and will
						constitute a breach of this Agreement and infringement or
						misappropriation of KOAMTAC (and its suppliers’) intellectual
						property rights.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>6.3
							Subscriber Rights.</b> As between the parties, CUSTOMER will have and
						retain all title and ownership of, and intellectual property and
						other rights in and to, CUSTOMER'S own data. CUSTOMER hereby
						grants to KOAMTAC a non-exclusive, non-transferable, worldwide,
						and royalty-free license to use CUSTOMER’S data for the purpose of
						performing its obligations under this Agreement.
					</p>

					<h4>Section 7. Indemnification.</h4>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>7.1 By
							CUSTOMER.</b> Unless prohibited by applicable law, CUSTOMER will
						defend and indemnify KOAMTAC and its Affiliates against
						Indemnified Liabilities in any Third-Party Legal Proceeding to the
						extent arising from: (i) any Application, Project, Instance,
						Customer Data or Customer Brand Features; or (ii) CUSTOMER’S, or
						its End Users’, use of the Services in violation of the AUP.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>7.2 By
							KOAMTAC.</b> KOAMTAC will defend and indemnify CUSTOMER and its
						Affiliates against Indemnified Liabilities in any Third-Party
						Legal Proceeding to the extent arising solely from an Allegation
						that use of (a) KOAMTAC technology used to provide the Services
						(excluding any open source software) or (b) any KOAMTAC Brand
						Feature infringes or misappropriates the third party’s patent,
						copyright, trade secret, or trademark.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>7.3
							Exclusions.</b> This Section 7 will not apply to the extent the
						underlying Allegation arises from:
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. the
						indemnified party’s breach of this Agreement;</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b.
						modifications to the indemnifying party’s technology by anyone
						other than the indemnifying party;</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c.
						combination of the indemnifying party’s technology with materials
						not provided by the indemnifying party; or</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d. use of
						non-current or unsupported versions of the Services;</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>7.4
							Conditions.</b> Sections 7.1 and 7.2 will apply only to the extent:
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. The
						indemnified party has promptly notified the indemnifying party in
						writing of any allegation(s) that preceded the any formal legal
						proceeding filed by an unaffiliated third party before a court or
						government ("Third-Party Legal Proceeding") and cooperates
						reasonably with the indemnifying party to resolve the
						allegation(s) and Third-Party Legal Proceeding. If breach of this
						Section 7.4(a) prejudices the defense of the Third-Party Legal
						Proceeding, the indemnifying party’s obligations under Section 7.1
						or 7.2 (as applicable) will be reduced in proportion to the
						prejudice.</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. The
						indemnified party tenders sole control of the indemnified portion
						of the Third-Party Legal Proceeding to the indemnifying party,
						subject to the following: (i) the indemnified party may appoint
						its own non-controlling counsel, at its own expense; and (ii) any
						settlement requiring the indemnified party to admit liability, pay
						money, or take (or refrain from taking) any action, will require
						the indemnified party’s prior written consent, not to be
						unreasonably withheld, conditioned, or delayed.</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>7.5
							Remedies.</b>
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. If
						KOAMTAC reasonably believes the Services might infringe a third
						party’s intellectual property rights, then KOAMTAC may, at its
						sole option and expense: (a) procure the right for CUSTOMER to
						continue using the Services; (b) modify the Services to make them
						non-infringing without materially reducing their functionality; or
						(c) replace the Services with a non-infringing, functionally
						equivalent alternative.</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. If
						KOAMTAC does not believe the remedies in Section 7.5(a) are
						commercially reasonable, then KOAMTAC may suspend or terminate
						CUSTOMER’S use of the impacted Services.</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>7.6 Sole
							Rights and Obligations.</b> Without affecting either party’s
						termination rights, this Section 7 states the parties’ only rights
						and obligations under this Agreement for intellectual property
						rights-related allegations and Third-Party Legal Proceedings.
					</p>

					<h4>Section 8. Warranties; Disclaimer; Damage Limitation.</h4>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>8.1
							CUSTOMER.</b> CUSTOMER represents and warrants that: (a) the
						execution and performance of this Agreement does not and will not
						violate any agreement to which it is a party or to which it is
						bound, (b) it is the owner of all rights in, or has obtained
						permission necessary to use, Customer Data, and no part of the
						Customer Data infringes upon the intellectual property rights of
						any third party, or is defamatory to any third party or violates
						any third party’s rights of privacy or publicity, and (c) the
						person executing this Agreement on CUSTOMER’S behalf has all
						necessary authority to bind CUSTOMER or Subscriber to this
						Agreement.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>8.2
							Disclaimers.</b> KOAMTAC PROVIDES ACCESS TO THE KOAMTACON APPLICATION
						“AS IS” AND DISCLAIMS ALL WARRANTIES WITH RESPECT TO IT OR ANY
						OTHER ITEMS, FUNCTIONS, MATERIALS OR SERVICES PROVIDED OR MADE
						AVAILABLE TO SUBSCRIBER, WHETHER EXPRESS OR IMPLIED, ARISING BY
						OPERATION OF LAW, OR OTHERWISE (INCLUDING, WITHOUT LIMITATION, ANY
						WARRANTIES OF TITLE, MERCHANTABILITY, FITNESS FOR A PARTICULAR
						PURPOSE, AND NON-INFRINGEMENT).
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;KOAMTAC AND
						ITS SUPPLIERS ARE NOT RESPONSIBLE OR LIABLE FOR THE DELETION OF OR
						FAILURE TO STORE ANY CUSTOMER DATA AND OTHER COMMUNICATIONS
						MAINTAINED OR TRANSMITTED THROUGH USE OF THE SERVICES. CUSTOMER IS
						SOLELY RESPONSIBLE FOR SECURING AND BACKING UP ITS APPLICATION,
						PROJECT, AND CUSTOMER DATA. NEITHER KOAMTAC NOR ITS SUPPLIERS,
						WARRANTS THAT THE OPERATION OF THE SOFTWARE OR THE SERVICES WILL
						BE ERROR-FREE OR UNINTERRUPTED. NEITHER THE SOFTWARE NOR THE
						SERVICES ARE DESIGNED, MANUFACTURED, OR INTENDED FOR HIGH RISK
						ACTIVITIES.</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>8.3 Damage
							Limitation.</b> IN NO EVENT SHALL KOAMTAC BE LIABLE TO SUBSCRIBER OR
						TO ANY THIRD PARTY FOR ANY INCIDENTAL, INDIRECT, CONSEQUENTIAL,
						PUNITIVE OR OTHER DAMAGES OF ANY KIND (INCLUDING, WITHOUT
						LIMITATION, DAMAGES FOR LOST PROFITS, REVENUE, DATA OR BUSINESS),
						WHETHER OR NOT KOAMTAC IS OR SHOULD BE AWARE OF THE POSSIBILITY OF
						SUCH DAMAGES. IN ANY EVENT, THE AMOUNT OF DAMAGES RECOVERABLE FROM
						KOAMTAC SHALL NOT, IN THE AGGREGATE, EXCEED THE TOTAL AMOUNTS PAID
						TO KOAMTAC DURING THE TWELVE MONTHS PRIOR TO THE EVENT GIVING RISE
						TO LIABILITY UNDER THIS AGREEMENT.
					</p>

					<h4>Section 9. Miscellaneous</h4>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>9.1
							Assignment.</b> Neither party may assign this Agreement or any right
						or obligation hereunder, by operation of law or otherwise, without
						the other party’s prior written consent. Subject to the foregoing
						restriction, this Agreement will bind and benefit the parties and
						their respective successors and assigns.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>9.2
							Governing Law.</b> Where CUSTOMER is a U.S. city, county or state
						government entity, then the Agreement will be silent regarding
						governing law and venue. Where CUSTOMER is a U.S. Federal
						government entity, then the following applies: all claims arising
						out of or relating to this Agreement or the Services will be
						governed by the laws of the United States of America, excluding
						its conflict of laws rules. Solely to the extent permitted by
						Federal law: (i) the laws of the State of New Jersey (excluding
						the conflict of laws rules of New Jersey) will apply in the
						absence of applicable Federal law; and (ii) for all claims arising
						out of or relating to this Agreement or the Services, the Parties
						consent to personal jurisdiction in, and the exclusive venue of,
						the courts in Middlesex County, New Jersey. Where CUSTOMER is not
						any type of domestic governmental entity as set forth immediately
						above, then the following applies: ALL CLAIMS ARISING OUT OF OR
						RELATING TO THIS AGREEMENT OR THE SERVICES WILL BE GOVERNED BY NEW
						JERSEY LAW, EXCLUDING THE CONFLICT OF LAWS RULES OF NEW JERSEY,
						AND WILL BE LITIGATED EXCLUSIVELY IN THE FEDERAL OR STATE COURTS
						OF MIDDLESEX COUNTY, NEW JERSEY, USA; THE PARTIES CONSENT TO
						PERSONAL JURISDICTION IN THOSE COURTS;AND CUSTOMER AGREES NOT TO
						COMMENCE OR PROSECUTE ANY SUCH ACTION, CLAIM OR PROCEEDING OTHER
						THAN IN THE AFOREMENTIONED COURTS.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>9.3
							Relationship Between the Parties.</b> KOAMTAC shall at all times be
						deemed to be an independent contractor and neither KOAMTAC nor any
						of its employees, subcontractors, or agents shall have the right
						or power to bind CUSTOMER. This Agreement shall not create or be
						deemed to create a joint venture, partnership, agency, or
						employer-employee relationship or other similar associations
						between KOAMTAC and CUSTOMER or any of either party’s employees,
						subcontractors or agents.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>9.4
							Modifications.</b> This Agreement may only be modified by a written
						agreement, duly signed by persons authorized to sign such
						agreements on behalf of the Parties thereto. The term “this
						Agreement” as used herein includes any applicable written
						supplement or future written amendment made in accordance
						herewith.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>9.5
							Severability.</b> If any provision or provisions of this Agreement
						are held invalid, illegal or unenforceable, the validity, legality
						and enforceability of the remaining provisions shall not in any
						way be affected or impaired thereby.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>9.6
							Notices.</b> Any notice or demand that either party may or must give
						to the other hereunder shall be in writing and delivered
						personally or sent by registered mail, addressed, if to KOAMTAC,
						as follows:
					</p>

					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;KoamTac, Inc.<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Attn: Legal<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;116 Village
						Boulevard, Suite 305<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Princeton, NJ
						08540 USA
					</p>

					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Electronic
						notifications must be sent via email to the KOAMTAC Legal
						Department at legal-notices@koamtac.com. Notice will be treated as
						given on receipt as verified by written or automated receipt or by
						electronic log (as applicable).</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>9.7
							Limitation of Actions.</b> No action, regardless of form, arising out
						of this Agreement may be brought by either party (1) in the case
						of an action for nonpayment, more than two years from the date the
						last payment was due; or (2) in the case of any other action, more
						than two years after the cause of action arose.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>9.8 Waiver.</b>
						No failure of either party to exercise any power or right granted
						under this Agreement, or to insist upon strict compliance by the
						other party of any obligation under this Agreement, and no custom
						or practice of either party with regard to the terms of
						performance of this Agreement, shall constitute a waiver of the
						rights of such party to demand full and exact compliance with the
						terms of this Agreement unless such waiver is in writing and
						signed by the party claimed to have waived such right.
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>9.9 Entire
							Agreement.</b> This Agreement sets forth the entire agreement, and
						supersedes any and all prior agreements and understanding, either
						oral or written, between the parties with respect to the subject
						matter hereof.
					</p>

					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The Parties
						have caused this Agreement to be executed by their authorized
						representatives as of the Effective Date.</p>

					<h4>Appendix A. Subscription Fee</h4>

					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. KOAMTACON
						subscription fee is free for one year for KDC registered users.</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. KOAMTACON
						subscription fee is free for one month for trial users.</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. KOAMTACON
						subscription fee is $9.95 per month per user or $99 per month per
						user.</p>

				</section>
				<!-- </mains> -->
			</div>
		</div>
	</div>