Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp1426838ywb;
        Mon, 11 Mar 2019 06:49:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzISyme4JcugSgo3Oer6YVt4scErogKuYni/9TsiMebcotu3xFUl/8h2LTGxg49H1EjPxe8
X-Received: by 2002:a62:41cc:: with SMTP id g73mr32560804pfd.145.1552312153140;
        Mon, 11 Mar 2019 06:49:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552312153; cv=none;
        d=google.com; s=arc-20160816;
        b=RNu43n1U8I8Uwk/jvYMQdMtyVmWPaXnN4tuPyT/TNAYbMpvXDiv2Vkf6Amgxyvy1PE
         xKgVZU3PwIMguZyLd7SXyHBNpYyolT24G+wbqTT7GH+Uwd+S0LiAVtg0Li7KqqcO3MXh
         /5LGXYejiw3U6CPtct7RAfnNFTRxXslVBVK+Sfsa/LjpHLnA/uSKXcLpwpeSz9tOfm2c
         3AIINVrZpdy214pGyLukwXy0gNDWhtlRanjka1/OqrqYKMvhxsOdFHGtfZrP/o5prMRd
         DET18sdpPqq7uuztwjdjVnLO97AJQEKcFTrQUMH1GcjhR/1Dh5SGcsBzPE/v2h3zUhx/
         q02g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:delivered-to;
        bh=HfLlNuJg5fFgjcJnPh7v8QSPwfccsl36GZyTNvSnH3U=;
        b=p6BA4JiLAccAO9dRaaO/wZxUiAB7bq/XgEdiENO/ayju0Y7v8fiD7iQ+l4cspUeKp0
         n/mWTSD7ZObCVX3iV5ETvEMmNzwTmguDdJHwh/ucLPgPqfItFaqZOmNPUyeboWHNfRa/
         gwK+2w2Dh0gWhtWstjgR1bJ/v2wto8ckXIdUKsz+bPp8MCSubtZpMqNvUPVRrIuAqAVA
         iRyhzrt4sm02szJmgDyuU5FDnyYXQjrjAIh0akEA70Em2SeQtzHqMNWZyZ7KeS3HCzWG
         OnrhFxgV66bs6/6bevSNTiGNUarqXpdEtFgljxJsGHZ3a4nkHgiAouDiUkcn5X8zL1IG
         K2qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id g18si5213660pfg.99.2019.03.11.06.49.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Mar 2019 06:49:13 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8B589A98;
	Mon, 11 Mar 2019 13:49:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5CA899FF;
 Mon, 11 Mar 2019 13:49:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2019 06:49:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,468,1544515200"; d="scan'208";a="151245052"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga004.fm.intel.com with ESMTP; 11 Mar 2019 06:49:10 -0700
Received: from fmsmsx115.amr.corp.intel.com (10.18.116.19) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 11 Mar 2019 06:49:10 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 fmsmsx115.amr.corp.intel.com (10.18.116.19) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 11 Mar 2019 06:49:10 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.158]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.134]) with mapi id 14.03.0415.000;
 Mon, 11 Mar 2019 21:49:08 +0800
From: "Li, Weinan Z" <weinan.z.li@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH] drm/i915: always pin hw_id for GVT context
Thread-Topic: [Intel-gfx] [PATCH] drm/i915: always pin hw_id for GVT context
Thread-Index: AQHU17ODA56IhMtoT0uKVjWTnNOkLKYGcUng
Date: Mon, 11 Mar 2019 13:49:08 +0000
Message-ID: <9BD218709B5F2A4F96F08B4A3B98A897733A3C36@SHSMSX101.ccr.corp.intel.com>
References: <20190311023747.1426-1-zhenyuw@linux.intel.com>
In-Reply-To: <20190311023747.1426-1-zhenyuw@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMWFiYWJkNTctMDRmNS00NjQ0LWFhY2ItZTk1ZDBjZGUzN2IzIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjIuNS4xOCIsIlRydXN0ZWRMYWJlbEhhc2giOiJydWkrUUZaRE93ZGc5MW5sdE45OWprUmJ0MVFBOU5jaXRNNEpMMUdVQ1FwVGtcL2YyTjBlczZ4cXdYYjI3ZTFUeSJ9
x-ctpclassification: CTP_NT
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC1nZnggW21haWx0bzpp
bnRlbC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmddIE9uIEJlaGFsZiBPZg0KPiBa
aGVueXUgV2FuZw0KPiBTZW50OiBNb25kYXksIE1hcmNoIDExLCAyMDE5IDEwOjM4IEFNDQo+IFRv
OiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBpbnRlbC1ndnQtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBbSW50ZWwtZ2Z4XSBbUEFUQ0hdIGRybS9p
OTE1OiBhbHdheXMgcGluIGh3X2lkIGZvciBHVlQgY29udGV4dA0KPiANCj4gSW5pdGlhbGx5IGZv
dW5kIGlzc3VlIHdpdGggY2xvc2VkIGNvbnRleHQgZGVidWcgY2hlY2sgd2hlbiBwaW4gaHdfaWQg
Zm9yIEdWVA0KPiBjb250ZXh0LCBsb29rcyB3ZSBzaG91bGQgYWx3YXlzIHBpbiBod19pZCBmb3Ig
dGhhdCBhcyBHVlQgY29udGV4dCBpcyBmaXhlZCBmb3INCj4gZWFjaCB2R1BVIGxpZmUgY3ljbGUs
IGFuZCB3ZSdkIGFsc28gbGlrZSB0byBnZXQgcGlubmVkIGh3X2lkIGUuZyBmb3IgcGVyZiByZWFz
b24sDQo+IGV0Yy4NCj4gDQo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4NCj4gU2lnbmVkLW9mZi1ieTogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwu
Y29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2NvbnRleHQuYyB8
IDcgKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2NvbnRleHQuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2NvbnRleHQuYw0KPiBpbmRleCBiOWYzMjE5NDc5
ODIuLmYzMzkxN2ViYWJlNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NV9nZW1fY29udGV4dC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2Nv
bnRleHQuYw0KPiBAQCAtNTA2LDYgKzUwNiwxMyBAQCBpOTE1X2dlbV9jb250ZXh0X2NyZWF0ZV9n
dnQoc3RydWN0IGRybV9kZXZpY2UNCj4gKmRldikNCj4gIAlpZiAoSVNfRVJSKGN0eCkpDQo+ICAJ
CWdvdG8gb3V0Ow0KPiANCj4gKwlyZXQgPSBpOTE1X2dlbV9jb250ZXh0X3Bpbl9od19pZChjdHgp
Ow0KPiArCWlmIChyZXQpIHsNCj4gKwkJY29udGV4dF9jbG9zZShjdHgpOw0KPiArCQljdHggPSBO
VUxMOw0KPiArCQlnb3RvIG91dDsNCj4gKwl9DQo+ICsNCkRvIHlvdSBtZWFuIHRoZSBCVUcgY2hl
Y2sgb2YgIiBpOTE1X2dlbV9jb250ZXh0X2lzX2Nsb3NlZCI/DQpHVlQtZyB0YWcgdGhlIGd2dCBj
b250ZXh0IGZsYWcgYXMgImNsb3NlZCIgaW4gImk5MTVfZ2VtX2NvbnRleHRfY3JlYXRlX2d2dCIs
IGl0IHNlZW1zIG5vdCB2ZXJ5IGFwcHJvcHJpYXRlLg0KDQoNCj4gIAljdHgtPmZpbGVfcHJpdiA9
IEVSUl9QVFIoLUVCQURGKTsNCj4gIAlpOTE1X2dlbV9jb250ZXh0X3NldF9jbG9zZWQoY3R4KTsg
Lyogbm90IHVzZXIgYWNjZXNzaWJsZSAqLw0KPiAgCWk5MTVfZ2VtX2NvbnRleHRfY2xlYXJfYmFu
bmFibGUoY3R4KTsNCj4gLS0NCj4gMi4yMC4xDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBJbnRlbC1nZnggbWFpbGluZyBsaXN0DQo+IElu
dGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVs
LWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
