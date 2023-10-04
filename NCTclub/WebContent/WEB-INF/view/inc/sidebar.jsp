<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>
<div class="col-md-2">
                <nav id="sidebar" class="sidebar text-white border-right" style="position: fixed; width: 200px;">
			            <div class="position-sticky">
			                <ul class="nav flex-column">
			                    <li class="nav-item">
			                        <a class="nav-link active" href="${ctxPath}/user/main" style="color: black;">
			        
			                            <b>ALL NCT MEMBERS</b>			                        </a>
			                    </li>
			                    <li class="nav-item">
			                        <a class="nav-link" href="${ctxPath}/admin/userlist" style="color: black;">
			                            <b>ALL USERS</b>			                        
			                        </a>
			                    </li>
			                    <li class="nav-item">
			                        <a class="nav-link" href="${ctxPath}/admin/nctregisterform" style="color: black;">	
			                        	<b>NCT REGISTER</b>		                        
			                        </a>
			                    </li>
			                </ul>
			            </div>
			        </nav>
				</div>