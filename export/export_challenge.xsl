<?xml version="1.0" ?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:param name="challengeId" select="''" />
	<xsl:param name="companyId"
		select="challenges/challenge[@id = $challengeId]/@companyId" />
	<xsl:template match="/">
		<fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master master-name="dvd_list"
					page-height="29.7cm" page-width="21cm" margin-top="1cm"
					margin-bottom="2cm" margin-left="2.5cm" margin-right="2.5cm">
					<fo:region-body margin-top="1cm" />
					<fo:region-before extent="2cm" />
					<fo:region-after extent="3cm" />
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="dvd_list">

				<fo:static-content flow-name="xsl-region-before">
					<fo:block text-align="center" font-size="8pt">
						Challenge Export of Challenge #
						<xsl:value-of select="$challengeId" />
						Page
						<fo:page-number />
					</fo:block>
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body">

					<xsl:apply-templates
						select="challenges/challenge[@id = $challengeId]" />

				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>

	<xsl:template match="challenge">
		<fo:block font-size="19pt" font-family="sans-serif"
			line-height="24pt" space-after.optimum="20pt"
			background-color="black" color="white" text-align="center"
			padding-top="5pt" padding-bottom="5pt">
			<xsl:value-of select="title" />
		</fo:block>
		<fo:block font-size="11pt" font-family="sans-serif"
			line-height="15pt" space-after.optimum="20pt"
			background-color="white" color="black" text-align="left"
			padding-top="5pt" padding-bottom="5pt">
			<xsl:value-of select="price" />
		</fo:block>
		<fo:block font-size="11pt" font-family="sans-serif"
			line-height="15pt" space-after.optimum="20pt"
			background-color="white" color="black" text-align="left"
			padding-top="5pt" padding-bottom="5pt">
			<xsl:value-of select="description" />
		</fo:block>
		<fo:block font-size="11pt" font-family="sans-serif"
			line-height="15pt" space-after.optimum="20pt"
			background-color="white" color="black" text-align="left"
			padding-top="5pt" padding-bottom="5pt">
			von Firma: 
			<xsl:value-of
				select="document('https://xml.temperli.online/database/companies.xml')/companies/company[@id = $companyId]/name" />
		</fo:block>
		<xsl:apply-templates
			select="registrations/registration" />
	</xsl:template>

	<xsl:template match="registration">
		<xsl:param name="communityId" select="@communityId" />
		<xsl:value-of select="$communityId" />
		<fo:block font-size="19pt" font-family="sans-serif"
			line-height="24pt" space-after.optimum="20pt"
			background-color="black" color="white" text-align="center"
			padding-top="5pt" padding-bottom="5pt" page-break-before="always">
			<xsl:value-of select="title" />
		</fo:block>
		<fo:block font-size="19pt" font-family="sans-serif"
			line-height="24pt" space-after.optimum="20pt"
			background-color="black" color="white" text-align="center"
			padding-top="5pt" padding-bottom="5pt">
			<xsl:value-of select="date" />
		</fo:block>
		<fo:block font-size="11pt" font-family="sans-serif"
			line-height="15pt" space-after.optimum="20pt"
			background-color="white" color="black" text-align="left"
			padding-top="5pt" padding-bottom="5pt">
			Communityname: 
			<xsl:value-of select="document('https://xml.temperli.online/database/communities.xml')/communities/community[@id = $communityId]/name" />
		</fo:block>
		<fo:block font-size="11pt" font-family="sans-serif"
			line-height="15pt" space-after.optimum="20pt"
			background-color="white" color="black" text-align="left"
			padding-top="5pt" padding-bottom="5pt">
			Beschreibung: 
			<xsl:value-of select="document('https://xml.temperli.online/database/communities.xml')/communities/community[@id = $communityId]/description" />
		</fo:block>
		<fo:block font-size="11pt" font-family="sans-serif"
			line-height="15pt" space-after.optimum="20pt"
			background-color="white" color="black" text-align="left"
			padding-top="5pt" padding-bottom="5pt">
			Grösse: 
			<xsl:value-of select="document('https://xml.temperli.online/database/communities.xml')/communities/community[@id = $communityId]/size" />
		</fo:block>
		<fo:block font-size="11pt" font-family="sans-serif"
			line-height="15pt" space-after.optimum="20pt"
			background-color="white" color="black" text-align="left"
			padding-top="5pt" padding-bottom="5pt">
			Ort: 
			<xsl:value-of select="document('https://xml.temperli.online/database/communities.xml')/communities/community[@id = $communityId]/location" />
		</fo:block>
		<fo:block font-size="11pt" font-family="sans-serif"
			line-height="15pt" space-after.optimum="20pt"
			background-color="white" color="black" text-align="left"
			padding-top="5pt" padding-bottom="5pt">
			E-Mail:  
			<xsl:value-of select="document('https://xml.temperli.online/database/communities.xml')/communities/community[@id = $communityId]/email" />
		</fo:block>
		<fo:block font-size="11pt" font-family="sans-serif"
			line-height="15pt" space-after.optimum="20pt"
			background-color="white" color="black" text-align="left"
			padding-top="5pt" padding-bottom="5pt">
			<xsl:value-of select="description" />
		</fo:block>
		<fo:block>
			<fo:external-graphic src="{pictureLink}"
				content-width="16cm" scaling="uniform" />
		</fo:block>
	</xsl:template>
</xsl:stylesheet>