Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2669695ywd;
        Sun, 13 Jan 2019 21:48:18 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7MaqGmz7cClQguCIL73/uPIlItDV8qJUhb5sHL7pp5E1zYcZ/jF+p1ZCxN0NU5TSdaFbHV
X-Received: by 2002:a17:902:9a9:: with SMTP id 38mr23658637pln.204.1547444898247;
        Sun, 13 Jan 2019 21:48:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547444898; cv=none;
        d=google.com; s=arc-20160816;
        b=i2PJOCBdZLXm9orbkIcqNcAQVhmSPO4bWv+bP6Pt7oqDLQarxMa3VT/DVG1SeGrTZE
         8SOTuh9SWi8jfHhAW9prooB318zvOweYn7ciyEWMAU2ssvcA+MufPCy8Gwx3n9Y3dEum
         nPPqLvq05hPtiqVe5/5dSa314LjQfRMmbu00K8aEF9r9UF+SZZ4KQiwBNd3EYFJ2pB2s
         570jUg4DTjQtv81S+RUaBgHkHm1iwcicCBZ5rGdxFhr0e8aQq0Os+GJdCpA3jMXNhQxg
         BawAUivMQM/ZWTtJzt9wpjMNHtlPfVK190dhGQVxkUXnRJk25YPaJuO3WJ77yzgy/4MM
         AEdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=L3/ADnKMuTkJmSTEgbAExaJLirdzr69ge3jAGu0V0sk=;
        b=F3S8RvxgsQu2PMpUSZLwoplt00fF1uufjTVn7Dzd9WyCqyqvHNg0RIQU/YNgmTP08M
         4SUy3i1qAjNFz0G9y8r5UYzjOpQMpTGgsUNRoh/EB4sE5weNCr0ahlhoAyf//mGV8eNM
         FurItZLbQcSCdEQLLQrL2KLV5XKbe954f+bPmHtjEP3qhQPxF8vSljFHFEjvi2Mykftk
         VHQoViLWxRTOgRwaWfXXe61n31kCYISHQoaA8sByFM5XZNFk2379NRyi0ka4UGVAri6t
         ad17OXDsh4pwEV/gARaIvR/pHKTbmPLo9JfmnRjqRVyiTO5+FRsx9+9dByHrnt5HOj9S
         reEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id o8si18946281plk.28.2019.01.13.21.48.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Jan 2019 21:48:18 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC30F6E043;
	Mon, 14 Jan 2019 05:48:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE686E043
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 14 Jan 2019 05:48:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2019 21:48:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,476,1539673200"; d="scan'208";a="266901685"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga004.jf.intel.com with ESMTP; 13 Jan 2019 21:48:16 -0800
Received: from fmsmsx116.amr.corp.intel.com (10.18.116.20) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 13 Jan 2019 21:48:16 -0800
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 fmsmsx116.amr.corp.intel.com (10.18.116.20) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 13 Jan 2019 21:48:15 -0800
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.196]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.63]) with mapi id 14.03.0415.000;
 Mon, 14 Jan 2019 13:48:13 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Hang Yuan <hang.yuan@linux.intel.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>
Subject: RE: [PATCH v1 1/4] drm/i915/gvt: add one hypercall to clean vfio
 regions
Thread-Topic: [PATCH v1 1/4] drm/i915/gvt: add one hypercall to clean vfio
 regions
Thread-Index: AQHUqNVaDPIXpztkhkWs8J53g2YAjqWtoo2AgAASWACAAAD+gIAAB/6AgACJVFA=
Date: Mon, 14 Jan 2019 05:48:13 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19C8E39A9@SHSMSX101.ccr.corp.intel.com>
References: <1547118288-1001-1-git-send-email-hang.yuan@linux.intel.com>
 <1547118288-1001-2-git-send-email-hang.yuan@linux.intel.com>
 <20190114035645.GX11631@zhen-hp.sh.intel.com>
 <44564146-3284-14d9-8679-891d874fa7b5@linux.intel.com>
 <20190114050557.GZ11631@zhen-hp.sh.intel.com>
 <f9de100c-be8e-617d-3a69-ae47feb4488a@linux.intel.com>
In-Reply-To: <f9de100c-be8e-617d-3a69-ae47feb4488a@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTIzY2E4ZDQtMDRhOC00MzlmLTg5MDYtOTlkZGQwNmQ5NDcyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoid0cwaVBPSEdNalpTZkRFWkJyaUh6WUhxN1IrU1VoQ0wwSm0xc0tDMjFXNndWZnFteFJkcWRGeVFZeXRiMGVaVyJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
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
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "kraxel@redhat.com" <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

PiBGcm9tOiBIYW5nIFl1YW4NCj4gU2VudDogTW9uZGF5LCBKYW51YXJ5IDE0LCAyMDE5IDE6MzUg
UE0NCj4gDQo+IE9uIDEvMTQvMTkgMTowNSBQTSwgWmhlbnl1IFdhbmcgd3JvdGU6DQo+ID4gT24g
MjAxOS4wMS4xNCAxMzowMjoyNCArMDgwMCwgSGFuZyBZdWFuIHdyb3RlOg0KPiA+PiBPbiAxLzE0
LzE5IDExOjU2IEFNLCBaaGVueXUgV2FuZyB3cm90ZToNCj4gPj4+IE9uIDIwMTkuMDEuMTAgMTk6
MDQ6NDUgKzA4MDAsIGhhbmcueXVhbkBsaW51eC5pbnRlbC5jb20gd3JvdGU6DQo+ID4+Pj4gRnJv
bTogSGFuZyBZdWFuIDxoYW5nLnl1YW5AbGludXguaW50ZWwuY29tPg0KPiA+Pj4+DQo+ID4+Pj4g
QWRkIG9uZSBoeXBlcmNhbGwgdG8gZnJlZSBWRklPIHJlZ2lvbiBtZW1vcnkuIEFsc28gY2FsbCBp
dCBpbiB2Z3B1DQo+ID4+Pj4gZGVzdHJveS4NCj4gPj4+Pg0KDQpJIHdvdWxkIG5vdCBjYWxsIGl0
IGFzIGh5cGVyY2FsbCwgYXMgaXQgaXMganVzdCBhIG5ldyBmdW5jdGlvbiBjYWxsYmFjay4NCmh5
cGVyY2FsbCBzcGVjaWZpY2FsbHkgbWVhbnMgYSBjYWxsIGZyb20gZ3Vlc3QgdG8gaHlwZXJ2aXNv
ci4NCg0KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IEhhbmcgWXVhbiA8aGFuZy55dWFuQGxpbnV4Lmlu
dGVsLmNvbT4NCj4gPj4+PiAtLS0NCj4gPj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
aHlwZXJjYWxsLmggfCAgMSArDQo+ID4+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2
bWd0LmMgICAgIHwgMTUgKysrKysrKysrKysrKysrDQo+ID4+Pj4gICAgZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L21wdC5oICAgICAgIHwgMTQgKysrKysrKysrKysrKysNCj4gPj4+PiAgICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5jICAgICAgfCAgMSArDQo+ID4+Pj4gICAgNCBmaWxl
cyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspDQo+ID4+Pj4NCj4gPj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2h5cGVyY2FsbC5oDQo+IGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2h5cGVyY2FsbC5oDQo+ID4+Pj4gaW5kZXggNTA3OTg4Ni4uMmFiNDEzOCAxMDA2
NDQNCj4gPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaHlwZXJjYWxsLmgNCj4g
Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaHlwZXJjYWxsLmgNCj4gPj4+PiBA
QCAtNjcsNiArNjcsNyBAQCBzdHJ1Y3QgaW50ZWxfZ3Z0X21wdCB7DQo+ID4+Pj4gICAgCWludCAo
KnNldF90cmFwX2FyZWEpKHVuc2lnbmVkIGxvbmcgaGFuZGxlLCB1NjQgc3RhcnQsIHU2NCBlbmQs
DQo+ID4+Pj4gICAgCQkJICAgICBib29sIG1hcCk7DQo+ID4+Pj4gICAgCWludCAoKnNldF9vcHJl
Z2lvbikodm9pZCAqdmdwdSk7DQo+ID4+Pj4gKwl2b2lkICgqY2xlYW5fcmVnaW9ucykodm9pZCAq
dmdwdSk7DQo+ID4+Pj4gICAgCWludCAoKmdldF92ZmlvX2RldmljZSkodm9pZCAqdmdwdSk7DQo+
ID4+Pj4gICAgCXZvaWQgKCpwdXRfdmZpb19kZXZpY2UpKHZvaWQgKnZncHUpOw0KPiA+Pj4+ICAg
IAlib29sICgqaXNfdmFsaWRfZ2ZuKSh1bnNpZ25lZCBsb25nIGhhbmRsZSwgdW5zaWduZWQgbG9u
ZyBnZm4pOw0KPiA+Pj4NCj4gPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2t2bWd0LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYw0KPiA+Pj4+
IGluZGV4IGExOWU2ODQuLjhjMzBkYzMgMTAwNjQ0DQo+ID4+Pj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2t2bWd0LmMNCj4gPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQva3ZtZ3QuYw0KPiA+Pj4+IEBAIC00OTMsNiArNDkzLDIwIEBAIHN0YXRpYyBpbnQga3ZtZ3Rf
c2V0X29wcmVnaW9uKHZvaWQgKnBfdmdwdSkNCj4gPj4+PiAgICAJcmV0dXJuIHJldDsNCj4gPj4+
PiAgICB9DQo+ID4+Pj4gK3N0YXRpYyB2b2lkIGt2bWd0X2NsZWFuX3JlZ2lvbnModm9pZCAqcF92
Z3B1KQ0KPiA+Pj4+ICt7DQo+ID4+Pj4gKwlpbnQgaTsNCj4gPj4+PiArCXN0cnVjdCBpbnRlbF92
Z3B1ICp2Z3B1ID0gKHN0cnVjdCBpbnRlbF92Z3B1ICopcF92Z3B1Ow0KPiA+Pj4+ICsNCj4gPj4+
PiArCWZvciAoaSA9IDA7IGkgPCB2Z3B1LT52ZGV2Lm51bV9yZWdpb25zOyBpKyspDQo+ID4+Pj4g
KwkJaWYgKHZncHUtPnZkZXYucmVnaW9uW2ldLm9wcy0+cmVsZWFzZSkNCj4gPj4+PiArCQkJdmdw
dS0+dmRldi5yZWdpb25baV0ub3BzLT5yZWxlYXNlKHZncHUsDQo+ID4+Pj4gKwkJCQkJJnZncHUt
PnZkZXYucmVnaW9uW2ldKTsNCj4gPj4+PiArCXZncHUtPnZkZXYubnVtX3JlZ2lvbnMgPSAwOw0K
PiA+Pj4+ICsJa2ZyZWUodmdwdS0+dmRldi5yZWdpb24pOw0KPiA+Pj4+ICsJdmdwdS0+dmRldi5y
ZWdpb24gPSBOVUxMOw0KPiA+Pj4+ICt9DQo+ID4+Pg0KPiA+Pj4gSXQgbG9va3MgYSBsaXR0bGUg
b3ZlcmtpbGwgdG8gcHV0IHRoaXMgcmVxdWlyZW1udCBvbiBhbGwgaHlwZXJ2aXNvciwNCj4gPj4+
IGFzIFZGSU8gcmVnaW9uIGlzIEtWTUdUIG9ubHkgdGhpbmcsIGUuZyBtaWdodCBub3QgYmUgdmFs
aWQgZm9yIG90aGVyDQo+IGh5cGVydmlzb3IuDQo+ID4+PiBBbmQgbG9va3Mgb3VyIHJlZ2lvbi5v
cHMucmVsZWFzZSBpcyBuZXZlciBhY3R1YWxseSB1c2VmdWwsIHdoYXQgd2UNCj4gbmVlZA0KPiA+
Pj4gaXMgdG8gZnJlZSB1cCB2Z3B1IHJlZ2lvbnMsIG1heWJlIGp1c3QgYXQgZGV0YWNoIHZncHUg
dGltZSB0byBsZXQNCj4gaHlwZXJ2aXNvcg0KPiA+Pj4gZG8gYW55IGNsZWFudXAgcmVxdWlyZWQu
DQo+ID4+Pg0KPiA+PiBIZW5yeTpTaW5jZSB0aGVyZSBpcyBhbHJlYWR5IGh5cGVyY2FsbCAnc2V0
X29wcmVnaW9uJywgSSB1c2UgaHlwZXJjYWxsIGFzDQo+ID4+IHdlbGwgdG8gZG8gcmVnaW9uIGNs
ZWFuIGZvciBvcHJlZ2lvbiBhbmQgZWRpZCByZWdpb24gdG8gaGF2ZSBjb25zaXN0ZW50DQo+ID4+
IGludGVyZmFjZSBiZXR3ZWVuIGd2dCBhbmQgaHlwZXJ2aXNvci4gJ2NsZWFuX3JlZ2lvbnMnIHdp
bGwgYWxzbyBiZSBjYWxsZWQNCj4gaWYNCj4gPj4gZmFpbHVyZSBpbiB2Z3B1IGNyZWF0ZS4gU28g
SSBkaWRuJ3QgaW1wbGVtZW50IGl0IGluIHZncHUgZGV0YWNoLg0KPiA+Pg0KPiA+DQo+ID4gInNl
dF9vcHJlZ2lvbiIgaHlwZXJjYWxsIG1lYW5zIGh5cGVydmlzb3IgbWlnaHQgaGF2ZSBkaWZmZXJl
bnQgd2F5cyB0bw0KPiA+IGV4cG9zZSBvcHJlZ2lvbiwgZS5nIHRocm91Z2ggdmZpbyByZWdpb24s
IGV0Yy4gU28gdGhhdCBtYWtlcyBzZW5zZSBmb3IgYQ0KPiA+IG1wdCBpbnRlcmZhY2UuIEJ1dCBo
ZXJlIG9ubHkgY2FyZSBhYm91dCBjbGVhbnVwIG9mIFZGSU8gcmVnaW9uLCBhbmQgYm90aA0KPiA+
IG9wcmVnaW9uIGFuZCBlZGlkIHJlZ2lvbidzIHJlbGVhc2UgZnVuY3Rpb24gaXMgbm9vcC4uDQo+
ID4NCj4gSGVucnk6IFNvIGRvIHlvdSBtZWFuIHRvIGV4cG9zZSB0aGUgZnVuY3Rpb25zIChjbGVh
bl9yZWdpb25zL3NldF9lZGlkKQ0KPiBpbiBrdm1ndCBpbnN0ZWFkIG9mIGh5cGVyY2FsbCBpZiB0
aGUgZnVuY3Rpb24gaXMgb25seSB2YWxpZCBmb3IgS1ZNPw0KPiANCj4gPj4+PiArDQo+ID4+Pj4g
ICAgc3RhdGljIHZvaWQga3ZtZ3RfcHV0X3ZmaW9fZGV2aWNlKHZvaWQgKnZncHUpDQo+ID4+Pj4g
ICAgew0KPiA+Pj4+ICAgIAlpZiAoV0FSTl9PTighKChzdHJ1Y3QgaW50ZWxfdmdwdSAqKXZncHUp
LT52ZGV2LnZmaW9fZGV2aWNlKSkNCj4gPj4+PiBAQCAtMTg3NCw2ICsxODg4LDcgQEAgc3RhdGlj
IHN0cnVjdCBpbnRlbF9ndnRfbXB0IGt2bWd0X21wdCA9IHsNCj4gPj4+PiAgICAJLmRtYV9tYXBf
Z3Vlc3RfcGFnZSA9IGt2bWd0X2RtYV9tYXBfZ3Vlc3RfcGFnZSwNCj4gPj4+PiAgICAJLmRtYV91
bm1hcF9ndWVzdF9wYWdlID0ga3ZtZ3RfZG1hX3VubWFwX2d1ZXN0X3BhZ2UsDQo+ID4+Pj4gICAg
CS5zZXRfb3ByZWdpb24gPSBrdm1ndF9zZXRfb3ByZWdpb24sDQo+ID4+Pj4gKwkuY2xlYW5fcmVn
aW9ucyA9IGt2bWd0X2NsZWFuX3JlZ2lvbnMsDQo+ID4+Pj4gICAgCS5nZXRfdmZpb19kZXZpY2Ug
PSBrdm1ndF9nZXRfdmZpb19kZXZpY2UsDQo+ID4+Pj4gICAgCS5wdXRfdmZpb19kZXZpY2UgPSBr
dm1ndF9wdXRfdmZpb19kZXZpY2UsDQo+ID4+Pj4gICAgCS5pc192YWxpZF9nZm4gPSBrdm1ndF9p
c192YWxpZF9nZm4sDQo+ID4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9tcHQuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tcHQuaA0KPiA+Pj4+IGluZGV4
IDliNDIyNWQuLjFhMDc5OTQgMTAwNjQ0DQo+ID4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L21wdC5oDQo+ID4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21wdC5o
DQo+ID4+Pj4gQEAgLTMxNCw2ICszMTQsMjAgQEAgc3RhdGljIGlubGluZSBpbnQNCj4gaW50ZWxf
Z3Z0X2h5cGVydmlzb3Jfc2V0X29wcmVnaW9uKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KQ0KPiA+
Pj4+ICAgIH0NCj4gPj4+PiAgICAvKioNCj4gPj4+PiArICogaW50ZWxfZ3Z0X2h5cGVydmlzb3Jf
Y2xlYW5fcmVnaW9ucyAtIENsZWFuIHJlZ2lvbnMgZm9yIGd1ZXN0DQo+ID4+Pj4gKyAqIEB2Z3B1
OiBhIHZHUFUNCj4gPj4+PiArICoNCj4gPj4+PiArICovDQo+ID4+Pj4gK3N0YXRpYyBpbmxpbmUg
dm9pZCBpbnRlbF9ndnRfaHlwZXJ2aXNvcl9jbGVhbl9yZWdpb25zKHN0cnVjdA0KPiBpbnRlbF92
Z3B1ICp2Z3B1KQ0KPiA+Pj4+ICt7DQo+ID4+Pj4gKwlpZiAoIWludGVsX2d2dF9ob3N0Lm1wdC0+
Y2xlYW5fcmVnaW9ucykNCj4gPj4+PiArCQlyZXR1cm47DQo+ID4+Pj4gKw0KPiA+Pj4+ICsJaW50
ZWxfZ3Z0X2hvc3QubXB0LT5jbGVhbl9yZWdpb25zKHZncHUpOw0KPiA+Pj4+ICt9DQo+ID4+Pj4g
Kw0KPiA+Pj4+ICsNCj4gPj4+PiArLyoqDQo+ID4+Pj4gICAgICogaW50ZWxfZ3Z0X2h5cGVydmlz
b3JfZ2V0X3ZmaW9fZGV2aWNlIC0gaW5jcmVhc2UgdmZpbyBkZXZpY2UgcmVmDQo+IGNvdW50DQo+
ID4+Pj4gICAgICogQHZncHU6IGEgdkdQVQ0KPiA+Pj4+ICAgICAqDQo+ID4+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvdmdwdS5jDQo+ID4+Pj4gaW5kZXggZTFjODYwZjguLmM1ZWI1NjUgMTAwNjQ0DQo+
ID4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYw0KPiA+Pj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmMNCj4gPj4+PiBAQCAtMjc2LDYgKzI3Niw3
IEBAIHZvaWQgaW50ZWxfZ3Z0X2Rlc3Ryb3lfdmdwdShzdHJ1Y3QgaW50ZWxfdmdwdQ0KPiAqdmdw
dSkNCj4gPj4+PiAgICAJV0FSTih2Z3B1LT5hY3RpdmUsICJ2R1BVIGlzIHN0aWxsIGFjdGl2ZSFc
biIpOw0KPiA+Pj4+ICsJaW50ZWxfZ3Z0X2h5cGVydmlzb3JfY2xlYW5fcmVnaW9ucyh2Z3B1KTsN
Cj4gPj4+PiAgICAJaW50ZWxfZ3Z0X2RlYnVnZnNfcmVtb3ZlX3ZncHUodmdwdSk7DQo+ID4+Pj4g
ICAgCWludGVsX3ZncHVfY2xlYW5fc2NoZWRfcG9saWN5KHZncHUpOw0KPiA+Pj4+ICAgIAlpbnRl
bF92Z3B1X2NsZWFuX3N1Ym1pc3Npb24odmdwdSk7DQo+ID4+Pj4gLS0NCj4gPj4+PiAyLjcuNA0K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBpbnRl
bC1ndnQtZGV2IG1haWxpbmcgbGlzdA0KPiBpbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lu
dGVsLWd2dC1kZXYNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aW50ZWwtZ3Z0LWRldgo=
