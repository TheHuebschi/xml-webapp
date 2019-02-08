<?xml version="1.0" ?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:param name="challengeId" select="''"/>
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
						Challenge Export of Challenge #<xsl:value-of select="$challengeId" /> Page 
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
			<xsl:value-of select="description" />
		</fo:block>
		<xsl:apply-templates select="registrations/registration" />
	</xsl:template>

	<xsl:template match="registration">
		<fo:block font-size="19pt" font-family="sans-serif"
			line-height="24pt" space-after.optimum="20pt"
			background-color="black" color="white" text-align="center"
			padding-top="5pt" padding-bottom="5pt">
			<xsl:value-of select="title" />
		</fo:block><fo:block font-size="19pt" font-family="sans-serif"
			line-height="24pt" space-after.optimum="20pt"
			background-color="black" color="white" text-align="center"
			padding-top="5pt" padding-bottom="5pt">
			<xsl:value-of select="date" />
		</fo:block>
		<fo:block font-size="11pt" font-family="sans-serif"
			line-height="15pt" space-after.optimum="20pt"
			background-color="white" color="black" text-align="left"
			padding-top="5pt" padding-bottom="5pt">
			<xsl:value-of select="description" />
		</fo:block>
	</xsl:template>
</xsl:stylesheet>