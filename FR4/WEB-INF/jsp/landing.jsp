
<%@ include file="/WEB-INF/jsp/include/tech.jsp" %>
<tag:page>
  <div class="smallTitle"><fmt:message key="common.landing"/></div>
  <br/>
  
  <div id="landing">
    <c:if test="${sessionUser.firstLogin}"><h2><fmt:message key="dox.welcomeToMango"/>!</h2></c:if>
    <jsp:include page="${filepath}"/>
  </div>

  <div dojoType="SplitContainer" orientation="horizontal" sizerWidth="3" activeSizing="true" class="borderDiv"
          widgetId="splitContainer" style="width: 100%; height: 500px;">

    <div dojoType="ContentPane" sizeMin="20" sizeShare="20" style="overflow:auto;padding:2px;">
      <div class="smallTitle">Useful Links</div>
        <a href="help.shtm">Help</a> 
        <a href="watchlist.shtm">Watch List</a> 
      <div class="smallTitle">Active Sensors</div>
    </div>

    <div dojoType="ContentPane" sizeMin="50" sizeShare="50" style="overflow:auto; padding:2px 10px 2px 2px;">
      <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td class="smallTitle"><fmt:message key="watchlist.watchlist"/> <tag:help id="watchList"/></td>
          <td align="right">
            <sst:select id="watchListSelect" value="${selectedWatchList}" onchange="watchListChanged()"
                    onmouseover="closeLayers();">
              <c:forEach items="${watchLists}" var="wl">
                <sst:option value="${wl.key}">${sst:escapeLessThan(wl.value)}</sst:option>
              </c:forEach>
            </sst:select>
            
            <div id="wlEditDiv" style="display:inline;" onmouseover="showWatchListEdit()">
              <tag:img id="wlEditImg" png="pencil" title="watchlist.editListName"/>
              <div id="wlEdit" style="visibility:hidden;left:0px;top:15px;" class="labelDiv"
                      onmouseout="hideLayer(this)">
                <fmt:message key="watchlist.newListName"/><br/>
                <input type="text" id="newWatchListName"
                        onkeypress="if (event.keyCode==13) $('saveWatchListNameLink').onclick();"/>
                <a class="ptr" id="saveWatchListNameLink" onclick="saveWatchListName()"><fmt:message key="common.save"/></a>
              </div>
            </div>
            
            <div id="usersEditDiv" style="display:inline;" onmouseover="showWatchListUsers()">
              <tag:img png="user" title="share.sharing" onmouseover="closeLayers();"/>
              <div id="usersEdit" style="visibility:hidden;left:0px;top:15px;" class="labelDiv">
                <tag:sharedUsers doxId="watchListSharing" noUsersKey="share.noWatchlistUsers"
                        closeFunction="hideLayer('usersEdit')"/>
              </div>
            </div>
            
            <tag:img png="copy" onclick="addWatchList(true)" title="watchlist.copyList" onmouseover="closeLayers();"/>
            <tag:img png="add" onclick="addWatchList(false)" title="watchlist.addNewList" onmouseover="closeLayers();"/>
            <tag:img png="delete" id="watchListDeleteImg" onclick="deleteWatchList()" title="watchlist.deleteList"
                    style="display:none;" onmouseover="closeLayers();"/>
            <tag:img png="report_add" onclick="createReport()" title="watchlist.createReport" onmouseover="closeLayers();"/>
          </td>
        </tr>
      </table>
      <div id="watchListDiv" class="watchListAttr">
        <table style="display:none;">
          <tbody id="p_TEMPLATE_">
            <tr id="p_TEMPLATE_BreakRow"><td class="horzSeparator" colspan="5"></td></tr>
            <tr>
              <td width="1">
                <table cellpadding="0" cellspacing="0" class="rowIcons">
                  <tr>
                    <td onmouseover="mango.view.showChange('p'+ getMangoId(this) +'Change', 4, 12);"
                            onmouseout="mango.view.hideChange('p'+ getMangoId(this) +'Change');"
                            id="p_TEMPLATE_ChangeMin" style="display:none;"><img alt="" id="p_TEMPLATE_Changing" 
                            src="images/icon_edit.png"/><div id="p_TEMPLATE_Change" class="labelDiv" 
                            style="visibility:hidden;top:10px;left:1px;" onmouseout="hideLayer(this);">
                      <tag:img png="hourglass" title="common.gettingData"/>
                    </div></td>
                    <td id="p_TEMPLATE_ChartMin" style="display:none;" onmouseover="showChart(getMangoId(this), event, this);"
                            onmouseout="hideChart(getMangoId(this), event, this);"><img alt="" 
                            src="images/icon_chart.png"/><div id="p_TEMPLATE_ChartLayer" class="labelDiv" 
                            style="visibility:hidden;top:0;left:0;"></div><textarea
                            style="display:none;" id="p_TEMPLATE_Chart"><tag:img png="hourglass"
                            title="common.gettingData"/></textarea></td>
                  </tr>
                </table>
              </td>
              <td id="p_TEMPLATE_Name" style="font-weight:bold"></td>
              <td id="p_TEMPLATE_Value" align="center"><img src="images/hourglass.png"/></td>
              <td id="p_TEMPLATE_Time" align="center"></td>
              <td style="width:1px; white-space:nowrap;">
                <input type="checkbox" name="chartCB" id="p_TEMPLATE_ChartCB" value="_TEMPLATE_" checked="checked"
                        title="<fmt:message key="watchlist.consolidatedChart"/>"/>
                <tag:img png="icon_comp" title="watchlist.pointDetails"
                        onclick="window.location='data_point_details.shtm?dpid='+ getMangoId(this)"/>
                <tag:img png="arrow_up_thin" id="p_TEMPLATE_MoveUp" title="watchlist.moveUp" style="display:none;"
                        onclick="moveRowUp('p'+ getMangoId(this));"/><tag:img png="arrow_down_thin"
                        id="p_TEMPLATE_MoveDown" title="watchlist.moveDown" style="display:none;"
                        onclick="moveRowDown('p'+ getMangoId(this));"/>
                <tag:img id="p_TEMPLATE_Delete" png="bullet_delete" title="watchlist.delete" style="display:none;"
                        onclick="removeFromWatchList(getMangoId(this))"/>
              </td>
            </tr>
            <tr><td colspan="5" style="padding-left:16px;" id="p_TEMPLATE_Messages"></td></tr>
          </tbody>
        </table>
        <table id="watchListTable" width="100%"></table>
        <div id="emptyListMessage" style="color:#888888;padding:10px;text-align:center;">
          <fmt:message key="watchlist.emptyList"/>
        </div>
      </div>
    </div>
  </div>
</td></tr>
</table>

</tag:page>
  
