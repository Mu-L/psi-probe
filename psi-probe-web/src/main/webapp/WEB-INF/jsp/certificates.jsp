<%--

    Licensed under the GPL License. You may not use this file except in compliance with the License.
    You may obtain a copy of the License at

      https://www.gnu.org/licenses/old-licenses/gpl-2.0.html

    THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
    WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR
    PURPOSE.

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html lang="${lang}">

    <head>
        <title><spring:message code="probe.jsp.title.certificates"/></title>
        <script src="<c:url value='/js/prototype.js'/>"></script>
    </head>

    <c:set var="navTabCertificates" value="active" scope="request"/>

    <body>

        <div id="certificates">

            <c:forEach items="${connectors}" var="connector">

                <h4 style="padding-top: 10px">${connector.name}</h4>

                <div class="connectorCertificates">

                    <c:forEach items="${connector.sslHostConfigInfos}" var="sslHostConfigInfo">
                        <c:set var="certs" value="${sslHostConfigInfo.trustStoreCerts}" scope="request" />
                        <h4><spring:message code="probe.jsp.certificates.trustStore"/></h4>
                        <c:import url="certificates_table.jsp" />

                        <c:forEach items="${sslHostConfigInfo.certificateInfos}" var="certificateInfo">
                            <c:set var="certs" value="${certificateInfo.keyStoreCerts}" scope="request" />
                            <h4><spring:message code="probe.jsp.certificates.keyStore"/></h4>
                            <c:import url="certificates_table.jsp" />
                        </c:forEach>
                    </c:forEach>

                </div>

            </c:forEach>
        </div>
    </body>
</html>
