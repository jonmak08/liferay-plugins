<div class="columns_1_4_1" id="main-content" role="main">
    <div class="portlet-layout row">
        <div class="col-md-12 portlet-column portlet-column-only" id="column-1">
            $processor.processPortlet("47")
            $processor.processColumn("column-1",
                "portlet-column-content portlet-column-content-only")
        </div>
    </div>


    <div class="portlet-layout row">
        <div class="col-md-6 portlet-column portlet-column-first" id="column-2">
            $processor.processPortlet("71")
            $processor.processColumn(
                "column-2",
                "portlet-column-content portlet-column-content-first")
        </div>
        <div class="col-md-4 portlet-column" id="column-3">
            $processor.processPortlet("26")
            $processor.processColumn("column-3", "portlet-column-content")
        </div>
        <div class="col-md-4 portlet-column" id="column-4">
            $processor.processPortlet("27")
            $processor.processColumn("column-4", "portlet-column-content")
        </div>
        <div class="col-md-6 portlet-column portlet-column-last" id="column-5">
            $processor.processPortlet("3")
            $processor.processColumn(
                "column-5",
                "portlet-column-content portlet-column-content-last")
        </div>
    </div>


    <div class="portlet-layout row-fluid">
        <div class="portlet-column portlet-column-only" id="column-6">
            $processor.processPortlet("135")
            $processor.processColumn(
                "column-6",
                "portlet-column-content portlet-column-content-only")
        </div>
    </div>
</div>