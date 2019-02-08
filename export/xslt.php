<?php

/**
 * perform XSLT transformation with PHP
 * @author Roland Christen <roland.christen@hslu.ch>
 * API: http://php.net/manual/en/class.xsltprocessor.php
 */

// load XML
$data = file_get_contents($_SERVER['DOCUMENT_ROOT'].'/database/challenges.xml');
$xml = new DOMDocument();
$xml->loadXML($data);

// load XSL
$xsl = new DOMDocument();
$xsl->load($_SERVER['DOCUMENT_ROOT'].'/export/export_challenge.xsl');

// transform
$processor = new XSLTProcessor();
$processor->importStylesheet($xsl);
$processor->setParameter('', 'challengeId', '2');
$dom = $processor->transformToDoc($xml);

// send result to client
$dom->save($_SERVER['DOCUMENT_ROOT'].'/export/cache/export.fo');