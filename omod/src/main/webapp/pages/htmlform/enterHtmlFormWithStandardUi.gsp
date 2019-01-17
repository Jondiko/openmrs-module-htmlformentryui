<%
    ui.decorateWith("appui", "standardEmrPage", [ patient: currentPatient ])

    ui.includeJavascript("uicommons", "angular.min.js");
    ui.includeJavascript("uicommons", "angular-resource.min.js");
    ui.includeCss("kenyaemr", "referenceapplication.css", 100)

    def breadcrumbMiddle = breadcrumbOverride ?: """
        [ { label: '${ returnLabel }' , link: '${ returnUrl }'} ]
    """
%>

<script type="text/javascript">
    var breadcrumbs = _.flatten([
        { icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
        ${ breadcrumbMiddle },
        { label: "${ ui.escapeJs(ui.format(htmlForm.form)) }" }
    ]);

    jq(function() {
        jq('.cancel').click(function(event) {
            event.preventDefault();
            htmlForm.cancel();
        });
    });
</script>


${ ui.includeFragment("htmlformentryui", "htmlform/enterHtmlForm", [
        patient: patient,
        htmlForm: htmlForm,
        visit: visit,
        returnUrl: returnUrl
]) }