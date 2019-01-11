Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2720923ywd;
        Fri, 11 Jan 2019 00:52:11 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5PpRcAKoiQQyHCouc3X9R1kInUZUo2JG98+kUwf/mfYPEUL7o3+Lsjce1BWtfMRwSP9y4H
X-Received: by 2002:a62:83ce:: with SMTP id h197mr13581398pfe.187.1547196731736;
        Fri, 11 Jan 2019 00:52:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547196731; cv=none;
        d=google.com; s=arc-20160816;
        b=R+JJ8APOeMGXiyxYLsIiY4xNMJcxJtEQTlRdsGlz8kPEHv0/QQjTXfL/0z0UPzISv2
         OB0/RgeyFnCERekyKJeUgnm5wLn9+M99ewoJM57KCUwGu/QwnqyWjj2RDnUN8llzzF/I
         V5A3/k+w2HkAf3KXJj5uNo/HEqUskD3A/FoBrAME/Wt5GaeMljQSv9YJCW5ooVfvWe3e
         daNNfOnkscEmsrtsaU2aQ1wBiA3u7FrurXMDvsAkGtr//rmEVXzuOmiCZLlwkEC4aVIA
         lLYtJXd7WWdXg4pdFA2mfXxLHcr1rjpTbdqGrdUSp2nw9Rxo8wEZmHEIqRfg29Dg9KW2
         +KVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=68v7kF7F65KtNlJlt4ZOkH2tFdx/zSzGMt8NsS0MZA4=;
        b=wyvvMGtge6dKOyWjajbFSd8pvdov4jNt+wTvr+0mbBj7aSyvEgy9OsUrVr7qAepYT7
         6UjAou9SgCSHL3Pe/FX9/vulRmxcd3/usep7uDXWzfhxF133RVInbPtttuIW0h9y20xO
         FsTmkBh0sk6mtUiDQrzDM49vAjL1DAGmoVWL4ZB3g2fejLsE5RRj/iz6ymzT9Gj8pa79
         SHIAQCbz8kooBmaPt7sIzJoga44aKAa01Uq8xEo+MkYhaWd/s+fKAyPFE1uL608u+UvA
         pTC7Y3DbG628qhfl0XwVXcZHdb/doVfwIgkW1AqYEN/H9TZXoLsx/3DEu89JyulRnEnb
         tCHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id m8si15882432pls.400.2019.01.11.00.52.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Jan 2019 00:52:11 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC3B6F57D;
	Fri, 11 Jan 2019 08:52:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C356F57D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Jan 2019 08:52:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jan 2019 00:52:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,465,1539673200"; d="scan'208";a="107450598"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga006.jf.intel.com with ESMTP; 11 Jan 2019 00:52:08 -0800
Received: from fmsmsx157.amr.corp.intel.com (10.18.116.73) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 11 Jan 2019 00:52:08 -0800
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 FMSMSX157.amr.corp.intel.com (10.18.116.73) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 11 Jan 2019 00:52:08 -0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.63]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.85]) with mapi id 14.03.0415.000;
 Fri, 11 Jan 2019 16:52:06 +0800
From: "Zhao, Yan Y" <yan.y.zhao@intel.com>
To: "Xu, Colin" <colin.xu@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/gvt: Allow F_CMD_ACCESS on mmio 0x21f0
Thread-Topic: [PATCH] drm/i915/gvt: Allow F_CMD_ACCESS on mmio 0x21f0
Thread-Index: AQHUqXaHoSmNVo6KqkaBX39JRF+uWKWpwqeg
Date: Fri, 11 Jan 2019 08:52:05 +0000
Message-ID: <F22B14EC3CFBB843AD3E03B6B78F2C6A4AD833FE@shsmsx102.ccr.corp.intel.com>
References: <20190111062554.16409-1-colin.xu@intel.com>
In-Reply-To: <20190111062554.16409-1-colin.xu@intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTE2YzZjNzYtZWJjZC00YTYxLWFjOGItYzhjNmFlYmZkMzUzIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoieWZPcFFnSFM0aU43RkVaczAwRjBrWDNvTFUxK29TZFwvREt6SXA3S2RVRHI1NXY1SEpZSXZsQU1YZDgrRWQrazkifQ==
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
Cc: "Xu, Colin" <colin.xu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

TG9va3MgZ29vZCB0byBtZS4NClJldmlld2VkLWJ5OiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRl
bC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaW50ZWwtZ3Z0
LWRldiBbbWFpbHRvOmludGVsLWd2dC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmdd
IE9uDQo+IEJlaGFsZiBPZiBDb2xpbiBYdQ0KPiBTZW50OiBGcmlkYXksIEphbnVhcnkgMTEsIDIw
MTkgMjoyNiBQTQ0KPiBUbzogaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
Q2M6IFh1LCBDb2xpbiA8Y29saW4ueHVAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0hdIGRy
bS9pOTE1L2d2dDogQWxsb3cgRl9DTURfQUNDRVNTIG9uIG1taW8gMHgyMWYwDQo+IA0KPiBUaGUg
bmV3bHkgdXBkYXRlZCBndWVzdCBkcml2ZXIgY291bGQgcHJvZ3JhbSAweDIxZjAgdmlhIGxyaSBh
bmQgc3JtLCB3aXRob3V0DQo+IEZfQ01EX0FDQ0VTUyBmbGFnIGNtZCBwYXJzZXIgd2lsbCBzdG9w
IHBhcnNlciByZXNldCBjbWQuDQo+IDB4MjFmMCBhcHBsaWVzIHRvIEJEVywgU0tMLCBLQkwsIEJY
VCBhbmQgQ0ZMLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ29saW4gWHUgPGNvbGluLnh1QGludGVs
LmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYyB8IDEg
Kw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvaGFuZGxlcnMuYw0KPiBpbmRleCA2OGE2MmJhNWJmNTQuLmE0Yjk2NTkwMTdmZCAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMNCj4gQEAgLTI3OTksNiArMjc5
OSw3IEBAIHN0YXRpYyBpbnQgaW5pdF9icm9hZHdlbGxfbW1pb19pbmZvKHN0cnVjdCBpbnRlbF9n
dnQNCj4gKmd2dCkNCj4gIAlNTUlPX0RGSChfTU1JTygweGUyYTApLCBEX0JEV19QTFVTLCBGX0NN
RF9BQ0NFU1MsIE5VTEwsDQo+IE5VTEwpOw0KPiAgCU1NSU9fREZIKF9NTUlPKDB4ZTJiMCksIERf
QkRXX1BMVVMsIEZfQ01EX0FDQ0VTUywgTlVMTCwNCj4gTlVMTCk7DQo+ICAJTU1JT19ERkgoX01N
SU8oMHhlMmMwKSwgRF9CRFdfUExVUywgRl9DTURfQUNDRVNTLCBOVUxMLA0KPiBOVUxMKTsNCj4g
KwlNTUlPX0RGSChfTU1JTygweDIxZjApLCBEX0JEV19QTFVTLCBGX0NNRF9BQ0NFU1MsIE5VTEws
DQo+IE5VTEwpOw0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiANCj4gLS0NCj4gMi4yMC4xDQo+IA0K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBpbnRl
bC1ndnQtZGV2IG1haWxpbmcgbGlzdA0KPiBpbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lu
dGVsLWd2dC1kZXYNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aW50ZWwtZ3Z0LWRldgo=
