<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="fr.terraApp.beans.ZoneChalandiseBean"%>
<%@ page import="fr.terraApp.beans.AdresseEntreesBean"%>
<%@ page import="fr.terraApp.beans.AdressePhotosBean"%>
<%@ page import="fr.terraApp.beans.BatimentBean"%>
<%
ArrayList<ZoneChalandiseBean> zCol = (ArrayList) request.getAttribute("zCol");
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>Mes adresses</title>
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico"/> <!-- Logo Terra -->
    <link href="assets/css/loader.css" rel="stylesheet" type="text/css" />
    <script src="assets/js/loader.js"></script>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Quicksand:400,500,600,700&display=swap" rel="stylesheet">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    
    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    <link href="assets/css/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <!-- <link href="assets/css/components/tabs-accordian/custom-tabs.css" rel="stylesheet" type="text/css" /> -->
    <link href="assets/css/dashboard/dash_1.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="plugins/table/datatable/datatables.css">
    <link rel="stylesheet" type="text/css" href="plugins/table/datatable/dt-global_style.css">
    <link rel="stylesheet" type="text/css" href="plugins/table/datatable/custom_dt_miscellaneous.css">
	<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.1/dist/leaflet.css"
   		integrity="sha256-sA+zWATbFveLLNqWO2gtiw3HL/lh1giY/Inf1BJ0z14="
   		crossorigin=""/>
   
    <style class="light-theme">
        .widget-one-content-area {
            background-color: #f1f2f3;
        }
        /*
            The below code is for DEMO purpose --- Use it if you are using this demo otherwise Remove it
        */
        .layout-px-spacing {
            min-height: calc(100vh - 123px)!important;
        }
        .topbar-nav.header nav#topbar ul.menu-categories li.menu .submenu {
            top: 54px;
        }
        .header-container .navbar .navbar-item .nav-item.dropdown .dropdown-menu {
            top: 49px;
        }
        @media (min-width: 1200px) {
            .shadow-icons {
                position: absolute;
                left: 18px;
                top: 18px;
            }
        }

    </style>

    <style class="dark-theme">
        /*
            The below code is for DEMO purpose --- Use it if you are using this demo otherwise Remove it
        */
        .layout-px-spacing {
            min-height: calc(100vh - 123px)!important;
        }
        .topbar-nav.header nav#topbar ul.menu-categories li.menu .submenu {
            top: 54px;
        }
        .header-container .navbar .navbar-item .nav-item.dropdown .dropdown-menu {
            top: 49px;
        }
        @media (min-width: 1200px) {
            .shadow-icons {
                position: absolute;
                left: 18px;
                top: 18px;
            }
        }

    </style>
    
    <!--*****************************************************************
	
							LEAFLET + OPENSTREETMAP

	*****************************************************************-->
    <style>
    	.map {
        	/* background-color: white; */
        	position: sticky!important;
        	height: 75vh; /* 100vh == une fois la taille de l’écran */
        	top: 0;
        	right: 0;
        	left: 0;
        }
        /****************************************************************** 
        	
        							À RÉFÉRENCER
        							 
         ******************************************************************/
        .marker.leaflet-popup {
        	margin-bottom: 16px;
        	cursor: pointer;
        	font-size: 0.6875rem; /* 11px; */
        	font-weight: bold;
        	padding: 5px 10px;
        	text-align: center;
        	box-shadow: /* 0 10px 20px -10px #4361ee; */ 0 0 10px rgba(0, 0, 0, 0.3);
        	background-color: #e2a03f;
        	color: white;
        }
        .marker.leaflet-popup::after {
        	content:'';
        	position: absolute;
        	top: 100%;
        	left: 50%;
        	width: 0;
        	height: 0;
        	margin-left: -8px;
        	border-left: 8px solid transparent;
        	border-right: 8px solid transparent;
        	border-top: 8px solid #e2a03f;
        }
        .marker .leaflet-popup-content-wrapper {
        	background: transparent;
		    color: inherit;
		    box-shadow: none;
		    text-align: inherit;
        }
        .marker .leaflet-popup-content {
        	text-align: inherit;
        	color: inherit;
        	margin: 0;
        }
        .marker .leaflet-popup-tip-container {
        	display: none;
        }
        .marker.is-active, .marker:hover {
        	z-index: 300;
        	background-color: #4361ee;
        	color: white;
        }
        .marker.is-active::after, .marker:hover::after {
        	border-top-color: #4361ee;
        }
        .marker.is-expanded {
        	background-color: white!important;
        	color: inherit!important;
        	z-index: 301;
        	text-align: left;
        }
        .marker.is-expanded::after {
        	border-top-color: white!important;
        }
        
        /****************************************************************** 
        	
        							RÉFÉRENCÉ
        							 
         ******************************************************************/
        .markerReferenced.leaflet-popup {
        	margin-bottom: 16px;
        	cursor: pointer;
        	font-size: 0.6875rem; /* 11px; */
        	font-weight: bold;
        	padding: 5px 10px;
        	text-align: center;
        	box-shadow: /* 0 10px 20px -10px #4361ee; */ 0 0 10px rgba(0, 0, 0, 0.3);
        	background-color: #1abc9c;
        	color: white;
        	width: 70px;
        }
        .markerReferenced.leaflet-popup::after {
        	content:'';
        	position: absolute;
        	top: 100%;
        	left: 50%;
        	width: 0;
        	height: 0;
        	margin-left: -8px;
        	border-left: 8px solid transparent;
        	border-right: 8px solid transparent;
        	border-top: 8px solid #1abc9c;
        }
        .markerReferenced .leaflet-popup-content-wrapper {
        	background: transparent;
		    color: inherit;
		    box-shadow: none;
		    text-align: inherit;
        }
        .markerReferenced .leaflet-popup-content {
        	text-align: inherit;
        	color: inherit;
        	margin: 0;
        	width: inherit!important;
        }
        .markerReferenced .leaflet-popup-tip-container {
        	display: none;
        }
        .markerReferenced.is-active, .markerReferenced:hover {
        	z-index: 300;
        	background-color: #4361ee;
        	color: white;
        }
        .markerReferenced.is-active::after, .markerReferenced:hover::after {
        	border-top-color: #4361ee;
        }
        .markerReferenced.is-expanded {
        	background-color: white!important;
        	color: inherit!important;
        	z-index: 301;
        	text-align: left;
        	font-weight: normal;
        	width: 450px;
        }
        .markerReferenced.is-expanded::after {
        	border-top-color: white!important;
        }
        
        /****************************************************************** 
        	
        							ARCHIVÉ
        							 
         ******************************************************************/
        .markerArchived.leaflet-popup {
        	margin-bottom: 16px;
        	cursor: pointer;
        	font-size: 0.6875rem; /* 11px; */
        	font-weight: bold;
        	padding: 5px 10px;
        	text-align: center;
        	box-shadow: /* 0 10px 20px -10px #4361ee; */ 0 0 10px rgba(0, 0, 0, 0.3);
        	background-color: #e7515a;
        	color: white;
        }
        .markerArchived.leaflet-popup::after {
        	content:'';
        	position: absolute;
        	top: 100%;
        	left: 50%;
        	width: 0;
        	height: 0;
        	margin-left: -8px;
        	border-left: 8px solid transparent;
        	border-right: 8px solid transparent;
        	border-top: 8px solid #e7515a;
        }
        .markerArchived .leaflet-popup-content-wrapper {
        	background: transparent;
		    color: inherit;
		    box-shadow: none;
		    text-align: inherit;
        }
        .markerArchived .leaflet-popup-content {
        	text-align: inherit;
        	color: inherit;
        	margin: 0;
        }
        .markerArchived .leaflet-popup-tip-container {
        	display: none;
        }
        .markerArchived.is-active, .markerArchived:hover {
        	z-index: 300;
        	background-color: #4361ee;
        	color: white;
        }
        .markerArchived.is-active::after, .markerArchived:hover::after {
        	border-top-color: #4361ee;
        }
        .markerArchived.is-expanded {
        	background-color: white!important;
        	color: inherit!important;
        	z-index: 301;
        	text-align: left;
        }
        .markerArchived.is-expanded::after {
        	border-top-color: white!important;
        }
        
        /****************************************************************** 
        	
        							DATATABLE
        							 
         ******************************************************************/
        .jsPopUptr.is-active, .jsPopUptr:hover {
        	background: rgba(234, 241, 255, 0.74);
        }

    </style>

    <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    
</head>
<body class="sidebar-noneoverflow" data-spy="scroll" data-target="#navSection" data-offset="100">

    <!-- BEGIN LOADER NAVBAR -->
	<jsp:include page="/Header" />
    <!--  END LOADER NAVBAR -->

    <!--  BEGIN MAIN CONTAINER  -->
    <div class="main-container" id="container">

        <div class="overlay"></div>
        <div class="search-overlay"></div>
        
        <!--  BEGIN CONTENT AREA  -->
        <div id="content" class="main-content">
            <div class="layout-px-spacing">

                <div class="page-header">
                    <nav class="breadcrumb-one" aria-label="breadcrumb">
                        <div class="title" style="margin-right: 0; border-right: none; padding-right: 0;">
                            <h3>Mes adresses</h3>
                        </div>
                    </nav>
    
                    <div class="toggle-switch">
                        <label class="switch s-icons s-outline  s-outline-secondary">
                            <input type="checkbox" checked="" class="theme-shifter">
                            <span class="slider round">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-sun"><circle cx="12" cy="12" r="5"></circle><line x1="12" y1="1" x2="12" y2="3"></line><line x1="12" y1="21" x2="12" y2="23"></line><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"></line><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"></line><line x1="1" y1="12" x2="3" y2="12"></line><line x1="21" y1="12" x2="23" y2="12"></line><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"></line><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"></line></svg>
    
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-moon"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"></path></svg>
                            </span>
                        </label>
                    </div>
                </div>


                <!-- CONTENT AREA -->
				<div class="row layout-spacing">
                    <div class="col-lg-7 text-center">
                    	<button id="virginModal" type="button" class="btn btn-primary" onclick="showVirginModal()">Ajouter une adresse</button>
                    </div>
				</div>                

                <!-- <div class="myContainer"> -->
                <div class="row mt-1"> <!-- layout-top-spacing -->
                    
                    <!-- <div class="col-xl-12 col-lg-12 col-md-12 col-12 layout-spacing">
                        <div class="widget widget-content-area br-4">
                            <div class="widget-one">

                                <h6>Kick Start you new project with ease!</h6>

                                <p class="mb-0 mt-3" style="color: #888ea8;">With CORK starter kit, you can begin your work without any hassle. The starter page is highly optimized which gives you freedom to start with minimal code and add only the desired components and plugins required for your project.</p>

                            </div>
                        </div>
                    </div> -->
                    
                    <div class="col-lg-7">
                        <div class="statbox widget box box-shadow">
                            <div class="widget-content widget-content-area">
                            
								<!-- <div class="table-form">
	                                <div class="form-group row mr-3">
	                                    <label for="min" class="col-sm-5 col-form-label col-form-label-sm">Minimum age:</label>
	                                    <div class="col-sm-7">
	                                        <input type="text" class="form-control form-control-sm" name="min" id="min" placeholder="">
	                                    </div>
	                                </div>
	
	                                <div class="form-group row">
	                                    <label for="max" class="col-sm-5 col-form-label col-form-label-sm">Maximum age:</label>
	                                    <div class="col-sm-7">
	                                        <input type="text" class="form-control form-control-sm" name="max" id="max" placeholder="">
	                                    </div>
	                                </div>
	                            </div> -->
       	
                                <table id="show-hide-col" class="table" style="width:100%">
                                    <thead class="table-hover" style="border-bottom: none;">
                                        <tr>
                                            <th class="text-center">Id</th>
                                            <th class="text-center">dateEnregistrement</th>
                                            <th class="text-center">dateMAJ</th>
                                            <th>Numero</th>
                                            <th>Indicateur</th>
                                            <th>Voie</th>
                                            <th>Nom</th>
                                            <th>Code Postal</th>
                                            <th>Ville</th>
                                            <th class="text-center">Statut</th>
                                            <th class="text-center">Archiver</th>
                                            <th>Commentaires</th>
                                            <th class="text-center dt-no-sorting">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <% 
                                    for ( ZoneChalandiseBean z : zCol) { 
                                    %>
                                        <%-- id="tr<%= ct.getId() %>" onclick="show('<%= ct.getId() %>')" --%>
                                        <tr id="jsPopUptr<%= z.getId() %>"
                                        	class="jsPopUptr"
                                        	data-idadresse="<%= z.getId() %>"
                                           	data-latitude="<%= z.getLatitude() %>" 
                                       		data-longitude="<%= z.getLongitude() %>"
                                       		data-numero="<%= z.getNumero() %>"
                                       		data-indicateur="<%= z.getIndicateur() %>"
                                       		data-voietype="<%= z.getVoie_type() %>"
                                       		data-voienom="<%= z.getVoie_nom() %>"
                                       		data-ville="<%= z.getVille() %>"
                                       		data-statut="<%= z.getStatut() %>"
                                       		data-archiver="<%= z.isArchiver() %>"
                                       		data-adresseentreeslength="<%= z.getAdresseEntrees().size() %>"
                                       	<%
                                       	int counterAddress = 0;
                                       	for ( AdresseEntreesBean a : z.getAdresseEntrees() ) {
                                       		counterAddress++;
                                       	%>
                                       		data-adresseacces<%= counterAddress %>="<%= a.getMoyensAcces() %>"
                                       		data-adressecom<%= counterAddress %>="<%= a.getMoyensCommunication() %>"
                                       	<%
                                       	}
                                       	%>
                                       		data-adressephotoslength="<%= z.getAdressePhotos().size() %>"
                                       	<%
                                       	int counterPhoto = 0;
                                       	for ( AdressePhotosBean a : z.getAdressePhotos() ) {
                                       		counterPhoto++;
                                       	%>
                                       		data-adressephotodateenregistrement<%= counterPhoto %>="<%= a.getDateEnregistrement() %>"
                                       		data-adressephoto<%= counterPhoto %>="<%= a.getUrl() %>"
                                       	<%
                                       	}
                                       	%>
                                       		data-batimentslength="<%= z.getBatiments().size() %>"
                                       	<%
                                       	int counterBatiment = 0;
                                       	for ( BatimentBean a : z.getBatiments() ) {
                                       		counterBatiment++;
                                       	%>                      	
                                       		data-batimentsdateenregistrement<%= counterBatiment %>="<%= a.getDateEnregistrement() %>"
                                       		data-batimentsdatemaj<%= counterBatiment %>="<%= a.getDateMAJ() %>"
                                       		data-batimentsnom<%= counterBatiment %>="<%= a.getNom() %>"
                                       		data-batimentsanneeconstruction<%= counterBatiment %>="<%= a.getAnneeConstruction() %>"
                                       		data-batimentstypeconstruction<%= counterBatiment %>="<%= a.getTypeConstruction() %>"
                                       		data-batimentsnombreetage<%= counterBatiment %>="<%= a.getNombreEtage() %>"
                                       		data-batimentsinfoscomplementaires<%= counterBatiment %>="<%= a.getInfosComplementaires() %>"
                                       		data-batimentsstatut<%= counterBatiment %>="<%= a.getStatut() %>"
                                       		data-batimentsarchiver<%= counterBatiment %>="<%= a.isArchiver() %>"
                                       		data-batimentscommentaire<%= counterBatiment %>="<%= a.getCommentaire() %>"
                                       	<%
                                       	}
                                       	%>
                                        	>
                                            <td class="jsPopUptd text-center"><%= z.getId() %></td>
                                            <td class="text-center"><%= z.getDateEnregistrement() %></td>
                                            <td class="text-center"><%= z.getDateMAJ() %></td>
                                            <td class="text-center"><%= z.getNumero() %></td>
										<%	
                                        if ( z.getIndicateur() != null ) {
                                        %>
                                            <td class="text-center"><%= z.getIndicateur() %></td>
                                        <%	
                                        } else {
                                        %>
                                        	<td class="text-center">-</td>
                                        <%
                                        }
                                        %>
                                            <td><%= z.getVoie_type() %></td>
                                            <td><%= z.getVoie_nom() %></td>
                                            <td class="text-center"><%= z.getCodePostal() %></td>
                                            <td><%= z.getVille() %></td>
                                        <% 
                                        if ( z.getStatut() == 0 ) { 
                                        %>
                                        	<td class="text-center"><span class="shadow-none badge badge-warning">À référencer</span></td>
                                        <% 
                                        } else if ( z.getStatut() == 1 ) { 
                                        %>
                                        	<td class="text-center"><span class="shadow-none badge badge-success">Référencé</span></td>
                                        <% 
                                        } 
                                        %>
										<%	
                                        if ( z.isArchiver() ) {
                                        %>
                                        	<td class="text-center"><span class="shadow-none badge badge-danger">Oui</span></td>
                                        <%
                                        	} else {
                                        %>
                                        	<td class="text-center"> - </td>
                                        <%
                                        	}
										%>
										<%	
                                        	if ( z.getCommentaire() != null ) {
                                        %>
                                            <td><%= z.getCommentaire() %></td>
                                        <% 
                                        } else { 
                                        %>
                                        	<td></td>
                                        <% } %>
                                            <td class="text-center">
												<div class="btn-group">
	                                                <button type="button" class="btn btn-dark btn-sm">Open</button>
	                                                <button type="button" class="btn btn-dark btn-sm dropdown-toggle dropdown-toggle-split" id="dropdownMenuReference1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-reference="parent">
	                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down"><polyline points="6 9 12 15 18 9"></polyline></svg>
	                                                </button>
	                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuReference1">
	                                                    <a class="dropdown-item" href="#">Modifier</a>
	                                                    <a class="dropdown-item" href="#">Supprimer</a>
	                                                    <a class="dropdown-item" href="#">Archiver / Désinscrire</a>
	                                                    <div class="dropdown-divider"></div>
	                                                    <a class="dropdown-item" href="#">Separated link</a>
	                                                </div>
	                                            </div>
                                            </td>
                                        </tr>
									<% 
                                    }
									%>
                                    </tbody>
                                    <tfoot>
                                        <tr style="background: rgba(234, 241, 255, 0.74);">
                                            <th class="text-center">Id</th>
                                            <th class="text-center">dateEnregistrement</th>
                                            <th class="text-center">dateMAJ</th>
                                            <th>Numero</th>
                                            <th>Indicateur</th>
                                            <th>Voie</th>
                                            <th>Nom</th>
                                            <th>Code Postal</th>
                                            <th>Ville</th>
                                            <th class="text-center">Statut</th>
                                            <th class="text-center">Archiver</th>
                                            <th>Commentaires</th>
                                            <th class="invisible"></th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                
                
	                <!-- MAP -->
	                <div class="col-lg-5">
	                	<div class="map" id="map"></div>
	                </div>
                </div>		
                <!-- CONTENT AREA -->

            </div>
            <div class="footer-wrapper">
                <div class="footer-section f-section-1">
                    <p class="">Copyright © 2021 <a target="_blank" href="https://designreset.com">DesignReset</a>, All rights reserved.</p>
                </div>
                <div class="footer-section f-section-2">
                    <p class="">Coded with <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg></p>
                </div>
            </div>
            
            
            
            			<div id="tabsSimple" class="col-lg-12 col-12 layout-spacing">
                            <div class="statbox widget box box-shadow">
                                <div class="widget-header">
                                    <div class="row">
                                        <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                                            <h4>Simple Tabs</h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="widget-content widget-content-area simple-tab">
                                    <ul class="nav nav-tabs  mb-3 mt-3" id="simpletab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Home</a>
                                        </li>
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Profile <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down"><polyline points="6 9 12 15 18 9"></polyline></svg></a>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Action</a>
                                                <a class="dropdown-item"  id="profile-tab2" data-toggle="tab" href="#profile2" role="tab" aria-controls="profile2" aria-selected="false">Another action</a>
                                            </div>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Contact</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content" id="simpletabContent">
                                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                            <p class="mb-4">
                                              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.                                                
                                            </p>

                                            <p>
                                              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                            </p>   
                                        </div>
                                        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                            <div class="media">
                                                <img class="mr-3" src="assets/img/90x90.jpg" alt="Generic placeholder image">
                                                <div class="media-body">
                                                    Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="profile2" role="tabpanel" aria-labelledby="profile-tab2">
                                            <p class="">
                                                Duis aute irure dolor in reprehenderit in voluptate velit esse
                                                cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                                                proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                            </p>
                                        </div>
                                        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                                            <p class="">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                                consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                                                cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                                                proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-12 col-12 layout-spacing">
                            <div class="statbox widget box box-shadow">
                                <div class="widget-header">
                                    <div class="row">
                                        <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                                            <h4>Circle with Icon</h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="widget-content widget-content-area rounded-circle-pills-icon">
                                    
                                    <ul class="nav nav-pills mb-4 mt-3  justify-content-center" id="rounded-circle-pills-icon-tab" role="tablist">
                                        <li class="nav-item mr-2">
                                            <a class="nav-link mb-1 rounded-circle active" id="rounded-circle-pills-icon-home-tab" data-toggle="pill" href="#rounded-circle-pills-icon-home" role="tab" aria-controls="rounded-circle-pills-icon-home" aria-selected="true"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg></a>
                                        </li>
                                        <li class="nav-item ml-2 mr-2">
                                            <a class="nav-link mb-1 rounded-circle" id="rounded-circle-pills-icon-profile-tab" data-toggle="pill" href="#rounded-circle-pills-icon-profile" role="tab" aria-controls="rounded-circle-pills-icon-profile" aria-selected="false"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg></a>
                                        </li>
                                        <li class="nav-item ml-2 mr-2">
                                            <a class="nav-link mb-1 rounded-circle" id="rounded-circle-pills-icon-contact-tab" data-toggle="pill" href="#rounded-circle-pills-icon-contact" role="tab" aria-controls="rounded-circle-pills-icon-contact" aria-selected="false"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-phone"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path></svg></a>
                                        </li>

                                        <li class="nav-item ml-2 mr-2">
                                            <a class="nav-link mb-1 rounded-circle" id="rounded-circle-pills-icon-settings-tab" data-toggle="pill" href="#rounded-circle-pills-icon-settings" role="tab" aria-controls="rounded-circle-pills-icon-settings" aria-selected="false"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-settings"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg></a>
                                        </li>
                                    </ul>

                                    <div class="tab-content" id="rounded-circle-pills-icon-tabContent">
                                        <div class="tab-pane fade show active" id="rounded-circle-pills-icon-home" role="tabpanel" aria-labelledby="rounded-circle-pills-icon-home-tab">
                                            <p class="mb-4">
                                              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.                                                
                                            </p>

                                            <p>
                                              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                            </p>
                                            </div>
                                        <div class="tab-pane fade" id="rounded-circle-pills-icon-profile" role="tabpanel" aria-labelledby="rounded-circle-pills-icon-profile-tab">
                                            <div class="media">
                                                <img class="mr-3" src="assets/img/90x90.jpg" alt="Generic placeholder image">
                                                <div class="media-body">
                                                    Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                                                </div>
                                              </div>
                                        </div>
                                        <div class="tab-pane fade" id="rounded-circle-pills-icon-contact" role="tabpanel" aria-labelledby="rounded-circle-pills-icon-contact-tab">
                                            <p class="dropcap  dc-outline-primary">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                                consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                                                cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                                                proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                            </p>
                                        </div>
                                        <div class="tab-pane fade" id="rounded-circle-pills-icon-settings" role="tabpanel" aria-labelledby="rounded-pills-icon-settings-tab">
                                            <blockquote class="blockquote">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                            </blockquote>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
        </div>
        <!--  END CONTENT AREA  -->

    </div>
    <!-- END MAIN CONTAINER -->

    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="assets/js/libs/jquery-3.1.1.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/app.js"></script>
    
    <script>
        $(document).ready(function() {
            App.init();
        });
    </script>
    <script src="plugins/highlight/highlight.pack.js"></script>
    <script src="assets/js/custom.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->
	<script src="assets/js/scrollspyNav.js"></script>

    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
	<script src="plugins/table/datatable/datatables.js"></script>
    <!-- NOTE TO Use Copy CSV Excel PDF Print Options You Must Include These Files  -->
    <script src="plugins/table/datatable/button-ext/dataTables.buttons.min.js"></script>
    <script src="plugins/table/datatable/button-ext/jszip.min.js"></script>    
    <script src="plugins/table/datatable/button-ext/buttons.html5.min.js"></script>
    <script src="plugins/table/datatable/button-ext/buttons.print.min.js"></script>
    <!-- <script src="plugins/table/datatable/custom_miscellaneous.js"></script> -->
    <!-- Make sure you put this AFTER Leaflet's CSS -->
 	<script src="https://unpkg.com/leaflet@1.9.1/dist/leaflet.js"
   		integrity="sha256-NDI0K41gVbWqfkkaHj15IzU7PtMoelkzyKp8TOaFQ3s="
   		crossorigin=""></script>
    <!-- END PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
    
    <script type="text/javascript">
    /*****************************************************************
	
							LEAFLET + OPENSTREETMAP

	*****************************************************************/
	var mapHTML = document.querySelector('#map')
    
	class LeafletMap {
    	
    	constructor () {
    		this.map = null;
    		this.popUpPointCol = []; // bornes
    	}
    	
    	load (element) {
    		this.map = L.map(element).setView([48.843933, 2.247391], 13);
    		L.tileLayer('//{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png', {
    	        maxZoom: 19,
    	        attribution: '© OpenStreetMap'
    	    }).addTo(this.map);
    	};
    	
    	addToPopUp (lat, lng, numero, indicateur, statut, archiver) {
    		
    		let numIndic = "";
    		if (indicateur !== "null") {
    			numIndic = numero + " " + indicateur;
    		} else {
    			numIndic = numero;
    		}
    		
    		let popUpPoint = [lat, lng];
    		this.popUpPointCol.push(popUpPoint);
    		return new LeafletMarker(popUpPoint, numIndic, this.map, statut, archiver);
    	};
    	
    	centerMap () {
    		this.map.fitBounds(this.popUpPointCol);
    	}
    }
    
    class LeafletMarker {
    	
    	constructor (popUpPoint, numIndic, map, statut, archiver) {
    		
    		this.numIndic = numIndic;
    		if (statut == 0 && archiver == "false") {
	    		this.popup = L.popup({
	    			autoClose: false,
	    			closeOnEscapeKey: true,
	    			closeOnClick: false,
	    			closeButton: false,
	    			className: 'marker',
	    			maxWidth: 400,
	    			maxHeight: 400
	    		})
	    			.setLatLng(popUpPoint)
	    			.setContent('n°' + numIndic)
	    			.openOn(map)
    		} else if (statut == 1 && archiver == "false") {
    			this.popup = L.popup({
	    			autoClose: false,
	    			closeOnEscapeKey: true,
	    			closeOnClick: false,
	    			closeButton: false,
	    			className: 'markerReferenced',
	    			maxWidth: 400,
	    			maxHeight: 400
	    		})
	    			.setLatLng(popUpPoint)
	    			.setContent('n°' + numIndic)
	    			.openOn(map)
    		} else {
    			this.popup = L.popup({
	    			autoClose: false,
	    			closeOnEscapeKey: true,
	    			closeOnClick: false,
	    			closeButton: false,
	    			className: 'markerArchived',
	    			maxWidth: 400,
	    			maxHeight: 400
	    		})
	    			.setLatLng(popUpPoint)
	    			.setContent('n°' + numIndic)
	    			.openOn(map)
    		}
    	}
    	
    	setActivePopUp () {
    		this.popup.getElement().classList.add('is-active'); // getElement() -> Leaflet
    	}
    	
    	unSetActivePopUp () {
    		this.popup.getElement().classList.remove('is-active'); // getElement() -> Leaflet
    	}
    	
    	addEventListener (event, cb) {
    		/* this.popup.addEventListener('add', => {}) */
    		this.popup.getElement().addEventListener(event, cb);
    	}
    	
    	setContent (text) {
    		this.popup.setContent(text);
    		this.popup.getElement().classList.add('is-expanded');
    		this.popup.update();	
    	}
    	
    	resetContent (text) {
    		this.popup.setContent(this.numIndic);
    		this.popup.getElement().classList.remove('is-expanded');
    		this.popup.update();
    	}
    }
	
	var initMap = function () {
		
    	let map = new LeafletMap();
    	let hoverMarker = null;
    	let hoverItem = null;
    	let activeMarker = null;
    	var expandedText = document.createElement('div');
    	
    	map.load(mapHTML);
    	
    	// récupérer le polyfill pour Array
    	Array.from(document.querySelectorAll('.jsPopUptr')).forEach((item) => {
    		
    		let marker = map.addToPopUp(item.dataset.latitude, item.dataset.longitude, 
    				item.dataset.numero, item.dataset.indicateur, 
    				item.dataset.statut, item.dataset.archiver);
    		
    		/* TABLE ADRESSE_ENTREES
    			console.log(item.dataset);
    			console.log("adresse size : " + item.dataset.adresseentreeslength);
    			console.log("acces : " + Object.keys(item.dataset) );
    			for (var key in obj) {
				    if (obj.hasOwnProperty(key)) {
				        console.log(key + " -> " + obj[key]);
					}
				}
    		*/
			const adresseEntreesTab = [];
    		if (item.dataset.adresseentreeslength > 0){
    			let acces = '';
    			let com = '';
    			for (let i = 1; i <= item.dataset.adresseentreeslength; i++) {
    				acces = 'adresseacces' + i;
    				com = 'adressecom' + i;
	    			/* console.log(item.dataset[acces]); */
	    			adresseEntreesTab.push(item.dataset[acces]);
	    			adresseEntreesTab.push(item.dataset[com]);
	    			acces = '';
	    			com = '';
    			}
    			console.log(adresseEntreesTab);
    		}
    		
    		/* TABLE ADRESSE_PHOTOS	*/
			const adressePhotosTab = [];
			if (item.dataset.adressephotoslength > 0){
				let date = '';
				let photo = '';
				for (let i = 1; i <= item.dataset.adressephotoslength; i++) {
					date = 'adressephotodateenregistrement' + i;
					photo = 'adressephoto' + i;
	    			adressePhotosTab.push(item.dataset[date]);
	    			adressePhotosTab.push(item.dataset[photo]);
	    			date = '';
	    			photo = '';
				}
				console.log(adressePhotosTab);
			}
			/* TABLE BATIMENTS	*/
			const batimentsTab = [];
			if (item.dataset.batimentslength > 0){
				let batimentsdateenregistrement = '';
				let batimentsdatemaj = '';
				let batimentsnom = '';
				let batimentsanneeconstruction = '';
				let batimentstypeconstruction = '';
				let batimentsnombreetage = '';
				let batimentsinfoscomplementaires = '';
				let batimentsstatut = '';
				let batimentsarchiver = '';
				let batimentscommentaire = '';
				for (let i = 1; i <= item.dataset.batimentslength; i++) {
					batimentsdateenregistrement = 'batimentsdateenregistrement' + i;
					batimentsdatemaj = 'batimentsdatemaj' + i;
					batimentsnom = 'batimentsnom' + i;
					batimentsanneeconstruction = 'batimentsanneeconstruction' + i;
					batimentstypeconstruction = 'batimentstypeconstruction' + i;
					batimentsnombreetage = 'batimentsnombreetage' + i;
					batimentsinfoscomplementaires = 'batimentsinfoscomplementaires' + i;
					batimentsstatut = 'batimentsstatut' + i;
					batimentsarchiver = 'batimentsarchiver' + i;
					batimentscommentaire = 'batimentscommentaire' + i;
					batimentsTab.push(item.dataset[batimentsdateenregistrement]);
					batimentsTab.push(item.dataset[batimentsdatemaj]);
					batimentsTab.push(item.dataset[batimentsnom]);
					batimentsTab.push(item.dataset[batimentsanneeconstruction]);
					batimentsTab.push(item.dataset[batimentstypeconstruction]);
					batimentsTab.push(item.dataset[batimentsnombreetage]);
					batimentsTab.push(item.dataset[batimentsinfoscomplementaires]);
					batimentsTab.push(item.dataset[batimentsstatut]);
					batimentsTab.push(item.dataset[batimentsarchiver]);
					batimentsTab.push(item.dataset[batimentscommentaire]);
					batimentsdateenregistrement = '';
					batimentsdatemaj = '';
					batimentsnom = '';
					batimentsanneeconstruction = '';
					batimentstypeconstruction = '';
					batimentsnombreetage = '';
					batimentsinfoscomplementaires = '';
					batimentsstatut = '';
					batimentsarchiver = '';
					batimentscommentaire = '';
				}
				console.log(batimentsTab);
			}
    		
    		// CONTROLER AFFICHAGE VIA DATATABLE
    		item.addEventListener('mouseover', function () {
    			if (hoverMarker !== null) {
    				hoverMarker.unSetActivePopUp();
    			}
    			marker.setActivePopUp();
    			hoverMarker = marker;
    			
    			/* marker.setActivePopUp();
    			activeMarker = marker; */
    		});
    		
    		item.addEventListener('mouseleave', function () {
    			if (hoverMarker !== null) {
    				hoverMarker.unSetActivePopUp();
    			}
    			
    			/* marker.unSetActivePopUp();
    			activeMarker = marker; */
    		});
    		
    		item.addEventListener('click', function() {
    			if (item.dataset.statut == 1) {
	    			if (activeMarker !== null) {
	    				activeMarker.resetContent();
	    			}
		    		expandedText.innerHTML = document.getElementById('blockOfPopUpExpanded').innerHTML;
	    			if (item.dataset.indicateur !== "null") {
		    			expandedText.innerHTML = expandedText.innerHTML
			    		    .replace(/{numero}/g, item.dataset.numero)
			    		    .replace(/{indicateur}/g, item.dataset.indicateur)
			    		    .replace(/{voie}/g, item.dataset.voietype)
			    		    .replace(/{nom}/g, item.dataset.voienom)
			    		    .replace(/{ville}/g, item.dataset.ville);
	    			} else {
	    				expandedText.innerHTML = document.getElementById('blockOfPopUpExpanded').innerHTML;
		    			expandedText.innerHTML = expandedText.innerHTML
			    		    .replace(/{numero}/g, item.dataset.numero)
			    		    .replace(/{indicateur}/g, "")
			    		    .replace(/{voie}/g, item.dataset.voietype)
			    		    .replace(/{nom}/g, item.dataset.voienom)
			    		    .replace(/{ville}/g, item.dataset.ville);
	    			}
	    			marker.setContent(expandedText);
	    			activeMarker = marker;
    			}
    		})
    		
    		// CONTROLER AFFICHAGE VIA LA MAP
    		marker.addEventListener('mouseover', function () {
    			if (hoverItem !== null) {
    				hoverItem = null;
    			}
    			hoverItem = item.classList.add('is-active');
    		});
    		
    		marker.addEventListener('mouseleave', function () {
    			if (hoverItem !== null) {
    				hoverItem = item.classList.remove('is-active');
    			}
    		});
    		
    		marker.addEventListener('click', function() {
    			if (item.dataset.statut == 1) {
	    			if (activeMarker !== null) {
	    				activeMarker.resetContent();
	    			}
	    			expandedText.innerHTML = document.getElementById('blockOfPopUpExpanded').innerHTML;
	    			if (item.dataset.indicateur !== "null") {
		    			expandedText.innerHTML = expandedText.innerHTML
			    		    .replace(/{numero}/g, item.dataset.numero)
			    		    .replace(/{indicateur}/g, item.dataset.indicateur)
			    		    .replace(/{voie}/g, item.dataset.voietype)
			    		    .replace(/{nom}/g, item.dataset.voienom)
			    		    .replace(/{ville}/g, item.dataset.ville);
	    			} else {
	    				expandedText.innerHTML = document.getElementById('blockOfPopUpExpanded').innerHTML;
		    			expandedText.innerHTML = expandedText.innerHTML
			    		    .replace(/{numero}/g, item.dataset.numero)
			    		    .replace(/{indicateur}/g, "")
			    		    .replace(/{voie}/g, item.dataset.voietype)
			    		    .replace(/{nom}/g, item.dataset.voienom)
			    		    .replace(/{ville}/g, item.dataset.ville);
	    			}
	    			marker.setContent(expandedText);
	    			activeMarker = marker;
    			}
    		})
    	});
    	
    	map.centerMap();
    }
    /*****************************************************************
     *****************************************************************
     *****************************************************************
     ***
     ***
     ***						DOC READY
     ***
     ***
     *****************************************************************
     *****************************************************************
     *****************************************************************/
    $(document).ready(function() {
	    
	    if (mapHTML !== null) {
	    	initMap();
	    }
		
		/* let map = L.map('map').setView([48.843933, 2.247391], 13);
	    
	    L.tileLayer('//{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png', {
	        maxZoom: 19,
	        attribution: '© OpenStreetMap'
	    }).addTo(map);
	    
	    L.popup()
	    .setLatLng([48.843933, 2.247391])
	    .setContent('<p>Hello world!<br />This is a nice popup.</p>')
	    .openOn(map); */
    	
    	/*****************************************************************
    	
    								DATATABLE
    	
    	*****************************************************************/
    	/* COPY, CSV, EXCELL, PRINT + SHOW HIDE COLUMN */
	    var table = $('#show-hide-col').DataTable( {
	    	"pagingType": "full_numbers",
	        "dom": "<'dt--top-section'<'row'<'col-sm-12 col-md-10 d-flex justify-content-md-start justify-content-center'B><'col-sm-12 col-md-2 d-flex justify-content-md-end justify-content-center mt-md-0 mt-3'f>>>" +
	        "<'dt--top-section'<'row'<'col-12 col-sm-6 d-flex justify-content-sm-start justify-content-center'l><'col-12 col-sm-6 d-flex justify-content-sm-end justify-content-center mt-sm-0 mt-3'>>>" +
	        "<'table-responsive'tr>" +
	        "<'dt--bottom-section d-sm-flex justify-content-sm-between text-center'<'dt--pages-count  mb-sm-0 mb-3'i><'dt--pagination'p>>",
	        "oLanguage": {
	            "oPaginate": { 
	                "sFirst": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg>',
	                "sPrevious": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>',
	                "sNext": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>',
	                "sLast": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>'
	            },
	            "sInfo": "Showing page _PAGE_ of _PAGES_",
	            "sSearch": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
	            "sSearchPlaceholder": "Search...",
	           "sLengthMenu": "Results :  _MENU_",
	        },
	        "stripeClasses": [],
	        "lengthMenu": [10, 20, 50, 100],
	        "pageLength": 10,
	        buttons: [
	            { extend: 'copy', className: 'btn btn-sm' },
	            { extend: 'csv', className: 'btn btn-sm' },
	            { extend: 'excel', className: 'btn btn-sm' },
	            { extend: 'print', className: 'btn btn-sm' },
	            {
	                text: 'id',
	                className: 'btn btn-primary btn-sm toggle-vis mb-1',
	                action: function(e, dt, node, config ) {
	                    var column = table.column( 0 );
	                    column.visible( ! column.visible() );
	                }
	            },
	            {
	                text: 'Enregistrement',
	                className: 'btn btn-primary btn-sm toggle-vis mb-1',
	                action: function(e, dt, node, config ) {
	                    var column = table.column( 1 );
	                    column.visible( ! column.visible() );
	                }
	            },
	            {
	                text: 'Mise à jour',
	                className: 'btn btn-primary btn-sm toggle-vis mb-1',
	                action: function(e, dt, node, config ) {
	                    var column = table.column( 2 );
	                    column.visible( ! column.visible() );
	                }
	            },
	            {
	                text: 'Numéro',
	                className: 'btn btn-primary btn-sm toggle-vis mb-1',
	                action: function(e, dt, node, config ) {
	                    var column = table.column( 3 );
	                    column.visible( ! column.visible() );
	                }
	            },
	            {
	                text: 'Indicateur',
	                className: 'btn btn-primary btn-sm toggle-vis mb-1',
	                action: function(e, dt, node, config ) {
	                    var column = table.column( 4 );
	                    column.visible( ! column.visible() );
	                }
	            },
	            {
	                text: 'Voie',
	                className: 'btn btn-primary btn-sm toggle-vis mb-1',
	                action: function(e, dt, node, config ) {
	                    var column = table.column( 5 );
	                    column.visible( ! column.visible() );
	                }
	            },
	            {
	                text: 'Nom',
	                className: 'btn btn-primary btn-sm toggle-vis mb-1',
	                action: function(e, dt, node, config ) {
	                    var column = table.column( 6 );
	                    column.visible( ! column.visible() );
	                }
	            },
	            {
	                text: 'Code',
	                className: 'btn btn-primary btn-sm toggle-vis mb-1',
	                action: function(e, dt, node, config ) {
	                    var column = table.column( 7 );
	                    column.visible( ! column.visible() );
	                }
	            },
	            {
	                text: 'Ville',
	                className: 'btn btn-primary btn-sm toggle-vis mb-1',
	                action: function(e, dt, node, config ) {
	                    var column = table.column( 8 );
	                    column.visible( ! column.visible() );
	                }
	            },
	            {
	                text: 'Statut',
	                className: 'btn btn-primary btn-sm toggle-vis mb-1',
	                action: function(e, dt, node, config ) {
	                    var column = table.column( 9 );
	                    column.visible( ! column.visible() );
	                }
	            },
	            {
	                text: 'Archiver',
	                className: 'btn btn-primary btn-sm toggle-vis mb-1',
	                action: function(e, dt, node, config ) {
	                    var column = table.column( 10 );
	                    column.visible( ! column.visible() );
	                }
	            },
	            {
	                text: 'Commentaires',
	                className: 'btn btn-primary btn-sm toggle-vis mb-1',
	                action: function(e, dt, node, config ) {
	                    var column = table.column( 11 );
	                    column.visible( ! column.visible() );
	                }
	            },
	        ]
	    } );
    	
	    /* SEARCH BOTTOM */
		// Setup - add a text input to each footer cell
	    $('#show-hide-col tfoot th').each( function () {
	        var title = $(this).text();
	        $(this).html( '<input type="text" class="form-control" placeholder="..."/>' ); /* Search ' + title + ' */
	    } );
		
	    table.columns().every( function () {
	        var that = this;
	 
	        $( 'input', this.footer() ).on( 'keyup change', function () {
	            if ( that.search() !== this.value ) {
	                that
	                    .search( this.value )
	                    .draw();
	            }
	        } );
	    } );
	    
	
    } );
    
    </script>
<!--     	Here's some random text.
    	<h1>Including HTML markup</h1>
    	And quotes too, or as one man said, "These are quotes, but
    	'these' are quotes too."<br><br>
    	<b>Vendor:</b> {VENDOR}<br>
    	<b>Product:</b> {PRODUCT}<br>
    	<b>Price:</b> {PRICE} 
-->
            	
    <script id="blockOfPopUpExpanded" type="text/html">

		            	<div id="tabsWithIcons" class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing">
<!--
							<div class="widget-header">
                                <div class="row">
                                    <div class="col-xl-12 col-md-12 col-sm-12 col-12 text-center"
										style="background-color: rgba(234, 241, 255, 0.74); height: 30px;">
										{numero} {indicateur} {voie} {nom} {ville}
                                    </div>
                                </div>
                            </div>
-->
                            <div class="widget-content widget-content-area rounded-pills-icon">
                                <ul class="nav nav-pills mb-2 mt-2  justify-content-center" id="rounded-pills-icon-tab" role="tablist">
                                    <li class="nav-item ml-2 mr-2">
<!-- active retiré de a::class -->                                
                                        <a class="nav-link mb-2 text-center " id="rounded-pills-icon-map-pin-tab" data-toggle="pill" href="#rounded-pills-icon-map-pin" role="tab" aria-controls="rounded-pills-icon-map-pin" aria-selected="true">
                                        	<svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg> Adresse</a>
                                    </li>
                                    <li class="nav-item ml-2 mr-2">
                                        <a class="nav-link mb-2 text-center" id="rounded-pills-icon-home-popupExpanded-tab" data-toggle="pill" href="#rounded-pills-icon-home-popupExpanded" role="tab" aria-controls="rounded-pills-icon-home-popupExpanded" aria-selected="false">
                                        	<svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg> Bâtiment(s)</a>
                                    </li>
                                </ul>

                                <div class="tab-content" id="rounded-pills-icon-tabContent">
                                    <div class="tab-pane fade active show" id="rounded-pills-icon-map-pin" role="tabpanel" aria-labelledby="rounded-pills-icon-map-pin-tab">
<!-- ADRESSE 
										<h6 class="mb-0 text-uppercase">chiffre d’affaire mensuel</h6>
										<hr/> 
	                					<div class="card">
	                  						<div class="card-body">
	                    						<div id="chiffreDAffaire"></div>
	                  						</div>
	                					</div>
-->
<div class="row">
	<div class="col-md-12 m2">
								<div class="widget-content widget-content-area">
                                    <div class="row">
										<div class="col-lg-12 col-md-12 mb-1 text-center">{numero} {indicateur} {voie} {nom} {ville}</div>
                                        <div class="col-lg-12 col-md-12">
                                            <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                                                <ol class="carousel-indicators">
                                                    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                                                    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                                                    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
                                                </ol>
                                                <div class="carousel-inner">
                                                    <div class="carousel-item active">
                                                        <img class="d-block w-100" src="assets/img/600x300.jpg" alt="First slide">
                                                        <div class="carousel-caption d-none d-sm-block">
                                                            2022-06-21
                                                        </div>
                                                    </div>
                                                    <div class="carousel-item">
                                                        <img class="d-block w-100" src="assets/img/600x300.jpg" alt="Second slide">
                                                        <div class="carousel-caption d-none d-sm-block">
                                                            <h3>Second slide</h3>
                                                            <h5>Lorem ipsum dolor sit amet, dolore magna aliqua.</h5>
                                                        </div>
                                                    </div>
                                                    <div class="carousel-item">
                                                        <img class="d-block w-100" src="assets/img/600x300.jpg" alt="Third slide">
                                                        <div class="carousel-caption d-none d-sm-block">
                                                            <h3>Third slide</h3>
                                                            <h5>Lorem ipsum dolor sit amet, dolore magna aliqua.</h5>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                                <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
	</div>
	<div class="col-md-12 m2 text-center"><h6 style="margin-top: 10px;">{numero} {indicateur} {voie} {nom}</h6></div>
	<div class="col-md-6 m2">
		<p style="margin-top: 0px; margin-bottom: 5px; color: silver;">
			Date création : ?
		</p>
	</div>
	<div class="col-md-6 m2">
		<p style="margin-top: 0px; margin-bottom: 5px; color: silver;">
			Date MAJ : ?
		</p>
	</div>
	<div class="col-md-6 m2">
		<h6 style="margin-top: 10px;">Description</h6>
		<p style="margin-top: 5px; margin-bottom: 0px;">
			Moyens d’accès : vigik</br>
			Type de com : visiophone</br>
		</p>
	</div>
	<div class="col-md-6 m2">
		<h6 style="margin-top: 10px;">Statistiques</h6>
		<p style="margin-top: 5px; margin-bottom: 0px;">
			Dernier boitage : 2022-06-21</br>
			Total bâtiment(s): 3</br>
			Total BAL : 150</br>
			Total habitation(s) : 140</br>
			Total organisation(s) : 10</br>
			Total stop pub : 50
		</p>	
	</div>
	<div class="col-md-12 m2">
		<h6 style="margin-top: 10px;">Actions menées</h6>
		<div class="row">
		<div class="col">
			<p style="margin-top: 0px; margin-bottom: 0px;">
				Dernier boitage adresse :</br>
				2022-06-21
			</p>
		</div>
		<div class="col">
			<p style="margin-top: 0px; margin-bottom: 0px;">
				Archiver : Non</br>
				Statut : Référencé
			</p>
		</div>
		</div>
	</div>
	<div class="col-md-12 m2">
		<h6 style="margin-top: 10px;">Commentaires :</h6>
		<p style="margin-top: 5px; margin-bottom: 0px;">
			Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur elementum, purus eu posuere dignissim, ante ligula convallis lectus, sed efficitur nibh orci at diam. Integer a vulputate quam. Phasellus sed lectus sit amet mi fringilla scelerisque. Donec sed sapien nec felis auctor tincidunt ac tincidunt lacus. Mauris venenatis non leo.
		</p>
	</div>
</div>
                                    </div>

                                    <div class="tab-pane fade" id="rounded-pills-icon-home-popupExpanded" role="tabpanel" aria-labelledby="rounded-pills-icon-home-popupExpanded-tab">
<!-- BATIMENTS
                                       	<h6 class="mb-0 text-uppercase">Nombre de nouvelles inscriptions mensuelles</h6>
										<hr/>
	                					<div class="card">
	                  						<div class="card-body">
	                    						<div id="nouveauxAbonnes"></div>
	                  						</div>
	                					</div>
-->
<div class="row">
	<div class="col-md-12 m2">
								<div class="widget-content widget-content-area">
                                    <div class="row">
										<div class="col-lg-12 col-md-12 mb-1 text-center">{numero} {indicateur} {voie} {nom} {ville}</div>
                                        <div class="col-lg-12 col-md-12">
                                            <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                                                <ol class="carousel-indicators">
                                                    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                                                    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                                                    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
                                                </ol>
                                                <div class="carousel-inner">
                                                    <div class="carousel-item active">
                                                        <img class="d-block w-100" src="assets/img/600x300.jpg" alt="First slide">
                                                        <div class="carousel-caption d-none d-sm-block">
                                                            2022-06-21
                                                        </div>
                                                    </div>
                                                    <div class="carousel-item">
                                                        <img class="d-block w-100" src="assets/img/600x300.jpg" alt="Second slide">
                                                        <div class="carousel-caption d-none d-sm-block">
                                                            <h3>Second slide</h3>
                                                            <h5>Lorem ipsum dolor sit amet, dolore magna aliqua.</h5>
                                                        </div>
                                                    </div>
                                                    <div class="carousel-item">
                                                        <img class="d-block w-100" src="assets/img/600x300.jpg" alt="Third slide">
                                                        <div class="carousel-caption d-none d-sm-block">
                                                            <h3>Third slide</h3>
                                                            <h5>Lorem ipsum dolor sit amet, dolore magna aliqua.</h5>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                                <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>		
	</div>


<div class="col-md-12 m2 text-center"><h6 style="margin-top: 10px;">Nom du bâtiment : A</h6></div>
	<div class="col-md-6 m2">
		<p style="margin-top: 0px; margin-bottom: 5px; color: silver;">
			Date création : 2022-06-05
		</p>
	</div>
	<div class="col-md-6 m2">
		<p style="margin-top: 0px; margin-bottom: 5px; color: silver;">
			Date MAJ : 2022-06-05
		</p>
	</div>
	<div class="col-md-6 m2">
		<h6 style="margin-top: 10px;">Description</h6>
		<p style="margin-top: 5px; margin-bottom: 0px;">
			Moyens d’accès : vigik</br>
			Type de com : visiophone</br>
			Type de construction : Hausmanien</br>
			Année de construction : 1945</br>
		</p>
	</div>
	<div class="col-md-6 m2">
		<h6 style="margin-top: 10px;">Statistiques</h6>
		<p style="margin-top: 5px; margin-bottom: 0px;">
			Nombre d’étage: 4</br>
			Total BAL : 50</br>
			Total habitation(s) : 46</br>
			Total organisation(s) : 4</br>
			Total stop pub : 15</br>
		</p>
	</div>
	<div class="col-md-12 m2">
		<h6 style="margin-top: 10px;">Actions menées</h6>
		<div class="row">
		<div class="col">
			<p style="margin-top: 0px; margin-bottom: 0px;">
				Dernier boitage bâtiment :</br>
				2022-06-21
			</p>
		</div>
		<div class="col">
			<p style="margin-top: 0px; margin-bottom: 0px;">
				Archiver : Non</br>
				Statut : Référencé
			</p>
		</div>
	</div>
</div>
	<div class="col-md-12 m2">
		<h6 style="margin-top: 10px;">Infos complementaires :</h6>
		<p style="margin-top: 5px; margin-bottom: 0px;">
			Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur elementum, purus eu posuere dignissim, ante ligula convallis lectus, sed efficitur nibh orci at diam. Integer a vulputate quam. Phasellus sed lectus sit amet mi fringilla scelerisque. Donec sed sapien nec felis auctor tincidunt ac tincidunt lacus. Mauris venenatis non leo.</br>
		</p>
		<h6 style="margin-top: 10px;">Commentaires :</h6>
		<p style="margin-top: 5px; margin-bottom: 0px;">
			Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur elementum, purus eu posuere dignissim, ante ligula convallis lectus, sed efficitur nibh orci at diam.
		</p>
	</div>
</div>

                                    </div>
                                    
                                </div>
                            </div>
                    	</div>			
	</script>
	
</body>
</html>