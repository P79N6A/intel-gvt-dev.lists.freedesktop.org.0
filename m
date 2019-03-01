Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp95451ywe;
        Thu, 28 Feb 2019 18:10:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqzXkx4xpJJG8No0JVxST7zSYCK40zsoYCmESB/HdmNQ1HoAhDO1E+47uMgTtMldYMHzpJlM
X-Received: by 2002:a63:5a42:: with SMTP id k2mr2354810pgm.333.1551406248023;
        Thu, 28 Feb 2019 18:10:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551406248; cv=none;
        d=google.com; s=arc-20160816;
        b=fqH6mlF8hoLAFCSGrEXbs5AFGnco2jFuK4fy3dGxKgWiToNjBxlB5anu5Gpijvzh0p
         u0ErfXOJdAXwoynftmJ953ONWVA6rcbl1D0BvXvBZZ9koKD5o6xIPQ3f710pgxPirAZx
         7dLl0hKc0MMMXBbYTlWD0XkeTEz/0kQ+PDWAwl3L9jr/U5L18/xr6jin+8koL9zloSdm
         IsoitI4kTiiuLj6D3HFGON/RJOeRoEpeFfKOS8RghCYlzkTxDoEOuV6BsINVCGBFuEC2
         eSzPm4DTyPZa4txGVz0dwRc5hdfrj9ShgEpc/YqJa/+QymuSHQmt6OUv3Bz/sHKK7DlG
         I2PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=YowqI5uZRpONqmq7w8ojLnCiG4eZnIWODEIgvRCm99o=;
        b=PW3wHUoM7gvwA88YmUvzUX9wBR0Ifbtaz9CB5zU0LF2T6D6/wzrcIBOax6xCNT8aQ2
         vWIPsmKZ34Iyk8tiVdLKp0IJUlK8w9oZ5ljaM1qOpGrDfydAemrFh0TJLEjuLd9P0mKv
         YxM7uG5us/hfdg/EWuklyE0l/WDwFQdCFxuDAVKm+fGZ2T8906MBlv10aZSo8r+w2qT5
         zkYTf7T8VnV4X0r7aOf7yGcl9AqxKIcDD8tJ2Ssd6G0CiKHcJP8aPfZVWRYxcGUFOQmZ
         RBt/gxKhQZRcpQzWHszzrsISIZrQ8dhf5S97EgpP0xF0TOog5Y+CpHRcIpeha3prsidc
         V+Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id n16si20022127pgj.27.2019.02.28.18.10.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 18:10:48 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F876E24B;
	Fri,  1 Mar 2019 02:10:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C85D6E24B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  1 Mar 2019 02:10:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2019 18:10:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,425,1544515200"; d="scan'208";a="137161436"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Feb 2019 18:10:44 -0800
Received: from fmsmsx114.amr.corp.intel.com (10.18.116.8) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 28 Feb 2019 18:10:44 -0800
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 FMSMSX114.amr.corp.intel.com (10.18.116.8) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 28 Feb 2019 18:10:43 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.74]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.223]) with mapi id 14.03.0415.000;
 Fri, 1 Mar 2019 10:10:41 +0800
From: "Zhang, Xiong Y" <xiong.y.zhang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 1/3] drm/i915/gvt: Don't submit request for error
 workload dispatch
Thread-Topic: [PATCH 1/3] drm/i915/gvt: Don't submit request for error
 workload dispatch
Thread-Index: AQHUz0vlP/7YfnxMrUutVmlN5rVGOaX2B+hw
Date: Fri, 1 Mar 2019 02:10:40 +0000
Message-ID: <8082FF9BCB2B054996454E47167FF4EC27543BCE@SHSMSX104.ccr.corp.intel.com>
References: <20190228095542.23356-1-zhenyuw@linux.intel.com>
In-Reply-To: <20190228095542.23356-1-zhenyuw@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiN2Q3N2Y4ZjItMGY0ZC00YmVlLThjYmYtZmVhY2U4ODIzM2ZjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTXV3eHBBVjAyeUwyU01pR3ZTbm9jODZUSTFuSTBaR0hsaUhQOWVTVzJcL3dReGcxNkVVcWhsN25EOFhxeDVsZmoifQ==
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
Cc: "Zhang, Xiong Y" <xiong.y.zhang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

DQo+IEFzIHZHUFUgc2hhZG93IGN0eCBpcyBsb2FkZWQgd2l0aCBndWVzdCBjb250ZXh0IHN0YXRl
LCBhcmJpdHJhcmlseSBzdWJtaXR0aW5nDQo+IHJlcXVlc3QgaW4gZXJyb3Igd29ya2xvYWQgZGlz
cGF0Y2ggcGF0aCB3b3VsZCBjYXVzZSB0cm91YmxlLg0KPiBTbyBkb24ndCB0cnkgdG8gc3VibWl0
IGluIGVycm9yIHBhdGggbm93IGxpa2UgaW4gcHJldmlvdXMgY29kZS4NCj4gVGhpcyBpcyB0byBm
aXggVk0gZmFpbHVyZSB3aGVuIEdQVSBoYW5nIGhhcHBlbnMuDQpbWmhhbmcsIFhpb25nIFldIEFz
IGluIHRoZSBwcmV2aW91cyBjb21tZW50cywgYXJiaXRyYXJpbHkgc3VibWl0dGluZw0KcmVxdWVz
dCBpbiBlcnJvciB3b3JrbG9hZCBkaXNwYXRjaCBwYXRoIHdvdWxkIGNhdXNlIGdwdSBoYW5nLiBC
dXQgd2hhdCdzIHRoZSBtZWFuIG9mICJUaGlzIGlzIHRvIGZpeCBWTSBmYWlsdXJlIHdoZW4gR1BV
IGhhbmcgaGFwcGVucyIgPw0KDQpSZXZpZXdlZC1ieTogWGlvbmcgWmhhbmcgKHhpb25nLnkuemhh
bmdAaW50ZWwuY29tKQ0KDQp0aGFua3MNCj4gDQo+IEZpeGVzOiBmMGU5OTQzNzI1MTggKCJkcm0v
aTkxNS9ndnQ6IEZpeCB3b3JrbG9hZCByZXF1ZXN0IGFsbG9jYXRpb24gYmVmb3JlDQo+IHJlcXVl
c3QgYWRkIikNCj4gU2lnbmVkLW9mZi1ieTogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50
ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYyB8
IDggKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMNCj4gYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMNCj4gaW5kZXggMWJiOGY5MzZmZGFhLi41
YjU5Y2JhOWY5M2EgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hl
ZHVsZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMNCj4g
QEAgLTY3OCw2ICs2NzgsNyBAQCBzdGF0aWMgaW50IGRpc3BhdGNoX3dvcmtsb2FkKHN0cnVjdA0K
PiBpbnRlbF92Z3B1X3dvcmtsb2FkICp3b3JrbG9hZCkgIHsNCj4gIAlzdHJ1Y3QgaW50ZWxfdmdw
dSAqdmdwdSA9IHdvcmtsb2FkLT52Z3B1Ow0KPiAgCXN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpk
ZXZfcHJpdiA9IHZncHUtPmd2dC0+ZGV2X3ByaXY7DQo+ICsJc3RydWN0IGk5MTVfcmVxdWVzdCAq
cnE7DQo+ICAJaW50IHJpbmdfaWQgPSB3b3JrbG9hZC0+cmluZ19pZDsNCj4gIAlpbnQgcmV0Ow0K
PiANCj4gQEAgLTcwMyw2ICs3MDQsMTMgQEAgc3RhdGljIGludCBkaXNwYXRjaF93b3JrbG9hZChz
dHJ1Y3QNCj4gaW50ZWxfdmdwdV93b3JrbG9hZCAqd29ya2xvYWQpDQo+IA0KPiAgCXJldCA9IHBy
ZXBhcmVfd29ya2xvYWQod29ya2xvYWQpOw0KPiAgb3V0Og0KPiArCWlmIChyZXQpIHsNCj4gKwkJ
LyogV2UgbWlnaHQgc3RpbGwgbmVlZCB0byBhZGQgcmVxdWVzdCB3aXRoDQo+ICsJCSAqIGNsZWFu
IGN0eCB0byByZXRpcmUgaXQgcHJvcGVybHkuLiAqLw0KPiArCQlycSA9IGZldGNoX2FuZF96ZXJv
KCZ3b3JrbG9hZC0+cmVxKTsNCj4gKwkJaTkxNV9yZXF1ZXN0X3B1dChycSk7DQo+ICsJfQ0KPiAr
DQo+ICAJaWYgKCFJU19FUlJfT1JfTlVMTCh3b3JrbG9hZC0+cmVxKSkgew0KPiAgCQlndnRfZGJn
X3NjaGVkKCJyaW5nIGlkICVkIHN1Ym1pdCB3b3JrbG9hZCB0byBpOTE1ICVwXG4iLA0KPiAgCQkJ
CXJpbmdfaWQsIHdvcmtsb2FkLT5yZXEpOw0KPiAtLQ0KPiAyLjIwLjENCj4gDQo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGludGVsLWd2dC1kZXYg
bWFpbGluZyBsaXN0DQo+IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRl
dg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwt
Z3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQt
ZGV2
