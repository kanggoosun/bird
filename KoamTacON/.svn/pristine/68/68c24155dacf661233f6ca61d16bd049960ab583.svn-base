function gf_initializeList(){
    var args = gf_initializeList.arguments;
    
    var targetId  = args.length > 0 ? args[0] != "" ? args[0] : DE_DATA_GRID_ID : DE_DATA_GRID_ID;
    
    var arrTargetId = targetId.split(",");
    
    for(var i=0; i<arrTargetId.length; i++){
        $("#" + arrTargetId[i] + " tbody").html("");
    }
}

function gf_makeListHtml(args){
    var targetId     = args.targetId == null || args.targetId == "" ? DE_DATA_GRID_ID : args.targetId;    // Data List Target ID
    var appendYn     = args.appendYn == null || args.appendYn == "" ? "N" : "Y";    // Data List 붙여넣기 여부[Y/N] : Default [N]
    var bodyHtml     = args.bodyHtml;       // Data List HTML
    var pageInfo     = args.pageInfo;       // Page Information
    var pageFunction = args.pageFunction;   // Page Link Function : Search Function !!
    var gridPageInfo    = args.gridPageInfo    == null || args.gridPageInfo    == "" ? "gridPageInfo"    : args.gridPageInfo;       // Grid Page Index
    var gridPageSummary = args.gridPageSummary == null || args.gridPageSummary == "" ? "gridPageSummary" : args.gridPageSummary;    // Grid Page Summary
    
    
    if(bodyHtml == ""){
        bodyHtml += '<tr>';
        bodyHtml += '    <td id="noResultList" colspan="' + $("#" + targetId + " col").length + '">There is no data.</td>';
        bodyHtml += '</tr>';
        
        $("#" + targetId + " tbody").html(bodyHtml);
        
        // Grid Page Information !!
        $("#" + gridPageInfo).html("");    // Page Index !!
    } else {
        // Data List HTML Setting
        if(appendYn == "Y"){
            $("#" + targetId + " tbody").append(bodyHtml);
        } else {
            $("#" + targetId + " tbody").html(bodyHtml);
        }
        /*
        // Page Information HTML Setting
        if(pageInfo != null){
            gf_pageIndexHtml(pageInfo, pageFunction, gridPageInfo, gridPageSummary);    // Grid 하단 Page Info !!
        }
        
        // Search 후 Grid 재설정 : Table Column Size / Select Box / Check Box
        gf_gridSearchReSetting(targetId);
        */
    }
}