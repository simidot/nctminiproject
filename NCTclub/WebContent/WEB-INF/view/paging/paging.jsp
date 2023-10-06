<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <div class="container">
				    <div class="row justify-content-start"> 
				        <div class="col-md-12">  
				            <div class="pagination-container text-center">
				                <ul class="pagination justify-content-center">        
				                    <!-- 처음, 이전 링크 -->
				                    <c:choose>
				                        <c:when test="${pagination.pg <= 1}">
				                            [<span style="color:gray">◀◀</span>]    
				                            [<span style="color:gray">◀</span>]
				                        </c:when>
				                        <c:otherwise>
				                            [<a href="${ctxPath}/admin/userlist?pg=1">◀◀</a>]
				                            [<a href="${ctxPath}/admin/userlist?pg=${pagination.pg - 1}">◀</a>] 
				                        </c:otherwise>
				                    </c:choose>
				                    <!-- 블록 범위 찍기 -->
				                    <c:forEach begin="${pagination.fromPage}" end="${pagination.toPage}" var="i">
				                        <c:choose>
				                            <c:when test="${i == pagination.pg}">
				                                [${i}]
				                            </c:when>
				                            <c:otherwise>
				                                [<a href="${ctxPath}/admin/userlist?pg=${i}">${i}</a>]
				                            </c:otherwise>
				                        </c:choose>
				                    </c:forEach>
				                    <!-- 다음, 마지막 링크 -->
				                    <c:choose>
				                        <c:when test="${pagination.pg >= pagination.allPage}">
				                            [<span style="color:gray">▶</span>]
				                            [<span style="color:gray">▶▶</span>]
				                        </c:when>
				                        <c:otherwise>
				                            [<a href="${ctxPath}/admin/userlist?pg=${pagination.pg + 1}">▶</a>]
				                            [<a href="${ctxPath}/admin/userlist?pg=${pagination.allPage}">▶▶</a>]
				                        </c:otherwise>
				                    </c:choose>
				                    
				                </ul>
				            </div>
				        </div>
				    </div>
				</div>