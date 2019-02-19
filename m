Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp2867261ywa;
        Mon, 18 Feb 2019 19:30:50 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaI3aOmYpCwfp4MG5sWhK0tVvkBlid4zCP01enKyZpiQR0OthJg+52Oe1NKX62I5s4cALiZ
X-Received: by 2002:a63:80c7:: with SMTP id j190mr7297749pgd.357.1550547050175;
        Mon, 18 Feb 2019 19:30:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550547050; cv=none;
        d=google.com; s=arc-20160816;
        b=Nf1ZUnqj4ZQlv4WlU9F13RIquK+EUS9b1FOdk5PgAIWxrE4d819vAc5w8HOBlxgcrr
         GbZvLKgWO7HNUb23f2IH5TDkAYI1UmWa3YlPyqEMSbDauLP2HasmHUerIfDfEJH5jocC
         1mBHP9ZnvHKjd1wYivLBxhbfl5oWo6ULhtDlcJFIfHPcIxju2nGoXqM+DVfOAHx4oHGz
         yVR3j7cc6nJESIlCRf5+Q19emhQ2q8JhAI5T9ie1rteG+Aw3UIoegI7s5SOwN+r93wV5
         9Dh2DKf9sAZBhH38u+Sr9X+p9OEqIg19m/+BOaNh1NrddEzTWK/Xu47jagmHej/xxEyN
         Bi8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=O+SJ9T7Fk3lKUCHir+ATzdwidyqbOeJ/N/pmKJkZxjo=;
        b=CW+hhCW6nLkgmQEaXnw4jJm8Lm7oAdrLJNegIUHCtLjvte9XY8EG2ElLMpdzE8Ze2S
         L/96DbgUx2IBT71nDkWm4w01lYRX6qHxT5COJGSfD8i1reWsmxXBDEeda+D+9NJB9iPt
         8qi9tRAl1xMozeB39zYjgjjmwihZIxYMPqrRW9yEfGI/E/5XTY2CLqp9j9A06t56vKzN
         W3nPspqcPddCnyur6dgrkbDKd5iuC4FH57NEtV4x372F7xz14yzX6z+/KfNuKPggplsG
         v1Oj0iA9TQRpjzTaIbao6+h9eMH5UJqJDVtgU56bkAF7gZChmGfn0jBc00HzMSr3BINe
         dyzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id l2si13816980pgq.163.2019.02.18.19.30.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Feb 2019 19:30:50 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A5289258;
	Tue, 19 Feb 2019 03:30:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE96C89258
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Feb 2019 03:30:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2019 19:30:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,385,1544515200"; d="scan'208";a="147913414"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by fmsmga001.fm.intel.com with ESMTP; 18 Feb 2019 19:30:46 -0800
Received: from fmsmsx152.amr.corp.intel.com (10.18.125.5) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 18 Feb 2019 19:30:46 -0800
Received: from shsmsx153.ccr.corp.intel.com (10.239.6.53) by
 FMSMSX152.amr.corp.intel.com (10.18.125.5) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 18 Feb 2019 19:30:46 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.102]) by
 SHSMSX153.ccr.corp.intel.com ([169.254.12.190]) with mapi id 14.03.0415.000;
 Tue, 19 Feb 2019 11:30:44 +0800
From: "Zhao, Yan Y" <yan.y.zhao@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/gvt: Fix MI_FLUSH_DW parsing with correct
 index check
Thread-Topic: [PATCH] drm/i915/gvt: Fix MI_FLUSH_DW parsing with correct
 index check
Thread-Index: AQHUx1XNSHkdbcmZqk2XhfymvHTg6aXmd39g
Date: Tue, 19 Feb 2019 03:30:43 +0000
Message-ID: <F22B14EC3CFBB843AD3E03B6B78F2C6A4ADAE435@SHSMSX104.ccr.corp.intel.com>
References: <20190218064653.26020-1-zhenyuw@linux.intel.com>
In-Reply-To: <20190218064653.26020-1-zhenyuw@linux.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjQwY2M3OTktMTVjOS00ZTRhLWJmMDAtOGQyMjk2MDNkOTFjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQnF4OFUxMW1BV0VHcVFPcUt1YWhsdDNqVk1CcW9TdThHXC9OK2drY0tKbHBHY2JBTWFEY05TSkFOZk52SysxeCsifQ==
x-ctpclassification: CTP_NT
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
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RG8gd2UgbmVlZCB0byBjaGVjayB3aGV0aGVyIHRoZSBpbmRleCBpcyBpbiBEV09SRCBvciBRV09S
RCwgd2hpY2ggaXMgc3BlY2lmaWVkIGluIERXT1JEIDAgb2YgdGhlIGNvbW1hbmQ/DQoNCkJUVywg
bWF5YmUgd2UgYWxzbyBuZWVkIHRvIGNoZWNrIHdoZXRoZXIgZ21hIGlzIFFXT1JEIGFsaWduZWQg
Pw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGludGVsLWd2dC1kZXYg
W21haWx0bzppbnRlbC1ndnQtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbg0K
PiBCZWhhbGYgT2YgWmhlbnl1IFdhbmcNCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSAxOCwgMjAx
OSAyOjQ3IFBNDQo+IFRvOiBpbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9pOTE1L2d2
dDogRml4IE1JX0ZMVVNIX0RXIHBhcnNpbmcgd2l0aCBjb3JyZWN0IGluZGV4DQo+IGNoZWNrDQo+
IA0KPiBXaGVuIE1JX0ZMVVNIX0RXIHBvc3Qgd3JpdGUgaHcgc3RhdHVzIHBhZ2UgaW4gaW5kZXgg
bW9kZSwgdGhlIGluZGV4IHZhbHVlDQo+IGlzIGluIGR3b3JkIHN0ZXAuIFRoaXMgZml4ZXMgd3Jv
bmcgcXdvcmQgc3RlcCBpbiBjbWQgcGFyc2VyIGNvZGUgd2hpY2gNCj4gaW5jb3JyZWN0bHkgc3Rv
cHBlZCBWTSBmb3IgaW52YWxpZCBNSV9GTFVTSF9EVyB3cml0ZSBpbmRleC4NCj4gDQo+IEZpeGVz
OiBiZTFkYTcwNzBhZWEgKCJkcm0vaTkxNS9ndnQ6IHZHUFUgY29tbWFuZCBzY2FubmVyIikNCj4g
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgIyB2NC4xMCsNCj4gU2lnbmVkLW9mZi1ieTogWmhl
bnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2NtZF9wYXJzZXIuYw0KPiBpbmRleCAzNWI0ZWMzZjc2MTguLmQ0MmY3YTJkYzgyZiAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jDQo+IEBAIC0xNDQxLDcgKzE0NDEs
NyBAQCBzdGF0aWMgaW5saW5lIGludCBjbWRfYWRkcmVzc19hdWRpdChzdHJ1Y3QNCj4gcGFyc2Vy
X2V4ZWNfc3RhdGUgKnMsDQo+ICAJfQ0KPiANCj4gIAlpZiAoaW5kZXhfbW9kZSkJew0KPiAtCQlp
ZiAoZ3Vlc3RfZ21hID49IEk5MTVfR1RUX1BBR0VfU0laRSAvIHNpemVvZih1NjQpKSB7DQo+ICsJ
CWlmIChndWVzdF9nbWEgPj0gSTkxNV9HVFRfUEFHRV9TSVpFIC8gc2l6ZW9mKHUzMikpIHsNCj4g
IAkJCXJldCA9IC1FRkFVTFQ7DQo+ICAJCQlnb3RvIGVycjsNCj4gIAkJfQ0KPiAtLQ0KPiAyLjIw
LjENCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQo+IGludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0DQo+IGludGVsLWd2dC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaW50ZWwtZ3Z0LWRldg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pbnRlbC1ndnQtZGV2
