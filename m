Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2792381ywd;
        Sun, 27 Jan 2019 19:28:34 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7clG6vylr8nQ1C3gnJXGk/jlKsubrHUwjMP5OqqtnrfdYUfbuS4xvKhOSo9AvpfzZdDri1
X-Received: by 2002:a17:902:4324:: with SMTP id i33mr19767366pld.227.1548646114902;
        Sun, 27 Jan 2019 19:28:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548646114; cv=none;
        d=google.com; s=arc-20160816;
        b=Vj9y/1GEAesrLkniAzVtb4ugKFAt3LDNQ/5FhTDZ2K+O6t7KVM9hWCmb9QsAxNOe5f
         5GvQfcHleWEx1cSkkzBDkfYBzHI9hZTLKe2aTfl49OvxeOQwheZDSvRETpqx5LDCghiU
         b812NnuWqBMHqLJVG4V7Ckps/YVdVe0Bx+EM1l4cRRgfn/JMKa9TrY/9nea8y9wlRfGk
         pdLzJAcOtPNSP1VbskC8ArDv6zQp/Ra7Jb9vMKPtE+3B0s7kraBs9QwBkErUPyHnOnWe
         ERYcrty4UMkt8YDLMmYoIHw8XJb71VfKPnNCTeR/T4viklu5eEZdW98BSmhlcJQAtUac
         aiIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=X/fUppnyN9lhEB8juIVDknjMRcMkXlySwBr35cII/0U=;
        b=IpWimpjZxun4htrIFKvXR1Kslj1yFd25igSVHfeqvmClLyzYLWOBoOCTbl3cZ3/ciV
         Zx0M5D4UiPzJzd6yQQP17tuL2VzATWo/glB6ee4hOAoVsXsAsG8GfCG9fj2EQT5gTdmV
         izVVZzYDbv2aXMOninLQWrEHBEjKqoA/PgbNt4eQj+hrdwncJ6tmSIXRin+DGVlsVTqP
         cb7zI7Lba5Wlt3+1gpggr2wQmX18TxKO1x5to3c/ncG96SkZzLJ9VdAggpSLTVsPrPzS
         Dwr6lLhxQOS8LcU9NFtDODUFEGyJxMpFtF3K8bHLFWqA1PTkul0Mc7bYsSpJkq4pst+V
         esgw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id 66si13325037plc.125.2019.01.27.19.28.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Jan 2019 19:28:34 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286066E38F;
	Mon, 28 Jan 2019 03:28:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A946E38F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 28 Jan 2019 03:28:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2019 19:28:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,532,1539673200"; d="scan'208";a="315356030"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga005.fm.intel.com with ESMTP; 27 Jan 2019 19:28:31 -0800
Received: from shsmsx153.ccr.corp.intel.com (10.239.6.53) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 27 Jan 2019 19:28:31 -0800
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.110]) by
 SHSMSX153.ccr.corp.intel.com ([169.254.12.190]) with mapi id 14.03.0415.000;
 Mon, 28 Jan 2019 11:28:29 +0800
From: "Zhao, Yakui" <yakui.zhao@intel.com>
To: "Tang, Feng" <feng.tang@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, 
 "Wang, Zhi A" <zhi.a.wang@intel.com>, Xiao Zheng <xiao.zheng@intel.com>,
 "He, Min" <min.he@intel.com>, Bing Niu <bing.niu@intel.com>
Subject: RE: [RFC PATCH] drm/i915/gvt: Try cma allocation first for oos page
 setup
Thread-Topic: [RFC PATCH] drm/i915/gvt: Try cma allocation first for oos
 page setup
Thread-Index: AQHUtrg28fhSZvxXVkyMf7J8oO1ICKXEBHaA
Date: Mon, 28 Jan 2019 03:28:28 +0000
Message-ID: <01363028D91B0B448414F51B4258CAA574C168BE@SHSMSX101.ccr.corp.intel.com>
References: <1548643580-91046-1-git-send-email-feng.tang@intel.com>
In-Reply-To: <1548643580-91046-1-git-send-email-feng.tang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNzI2MzYzMzMtODZkMC00YmZlLWE0ODgtN2I4OTViNTdkNDRlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoia0dwaHhZTkt1N2djU0hqUnBHUlVkRTk4TGtTSG5FcTRMQm5kR1hJcWI2YU16TG5TaFBnVHFVT2hPQVZrNDNHcCJ9
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
Cc: "Tang, Feng" <feng.tang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IGludGVsLWd2dC1kZXYgW21h
aWx0bzppbnRlbC1ndnQtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbg0KPkJl
aGFsZiBPZiBGZW5nIFRhbmcNCj5TZW50OiBNb25kYXksIEphbnVhcnkgMjgsIDIwMTkgMTA6NDYg
QU0NCj5UbzogaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFpoZW55dSBXYW5n
DQo+PHpoZW55dXdAbGludXguaW50ZWwuY29tPjsgV2FuZywgWmhpIEEgPHpoaS5hLndhbmdAaW50
ZWwuY29tPjsgWGlhbw0KPlpoZW5nIDx4aWFvLnpoZW5nQGludGVsLmNvbT47IEhlLCBNaW4gPG1p
bi5oZUBpbnRlbC5jb20+OyBCaW5nIE5pdQ0KPjxiaW5nLm5pdUBpbnRlbC5jb20+DQo+Q2M6IFRh
bmcsIEZlbmcgPGZlbmcudGFuZ0BpbnRlbC5jb20+DQo+U3ViamVjdDogW1JGQyBQQVRDSF0gZHJt
L2k5MTUvZ3Z0OiBUcnkgY21hIGFsbG9jYXRpb24gZmlyc3QgZm9yIG9vcyBwYWdlIHNldHVwDQo+
DQo+V2hlbiBkb2luZyBib290dGltZSBwcm9maWxpbmcsIHdlIGZvdW5kIHRoZSBvb3MgcGFnZSBz
ZXR1cCB0YWtlcyBhYm91dA0KPjI1fjMwIG1zLCB3aGlsZSB1c2luZyBjbWEgYWxsb2NhdGlvbiB0
YWtlcyBsZXNzIHRoYW4gMTAgbXMuIEFuZCBpZiB0aGUNCj5wcmVhbGxvY2F0ZWRfb29zX3BhZ2Vz
IGluY3JlYXNlcyBpbiBmdXR1cmUsIGl0IHdpbGwgc2F2ZSBtb3JlLg0KPg0KPlRoaXMgY29tbWl0
IHdpbGwgdHJ5IHRvIGFsbG9jYXRlIHRoZSBtZW1vcnkgZnJvbSBDTUEgZmlyc3QsIGFuZCBmYWxs
IGJhY2sgdG8NCj50aGUgb3JpZ2luYWwga3phbGxvYyBpZiBDTUEgaXMgbm90IGF2YWlsYWJsZS4N
Cj4NCj5TaWduZWQtb2ZmLWJ5OiBGZW5nIFRhbmcgPGZlbmcudGFuZ0BpbnRlbC5jb20+DQo+LS0t
DQo+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyB8IDI2ICsrKysrKysrKysrKysrKysr
KysrKy0tLS0tDQo+IDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQ0KPg0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMNCj5pbmRleCBjNzEwM2RkLi5lOGQ2ZjEwIDEw
MDY0NA0KPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYw0KPisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYw0KPkBAIC0yNDk2LDE4ICsyNDk2LDM0IEBAIHN0YXRp
YyB2b2lkIGNsZWFuX3NwdF9vb3Moc3RydWN0IGludGVsX2d2dCAqZ3Z0KQ0KPnN0YXRpYyBpbnQg
c2V0dXBfc3B0X29vcyhzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQpICB7DQo+IAlzdHJ1Y3QgaW50ZWxf
Z3Z0X2d0dCAqZ3R0ID0gJmd2dC0+Z3R0Ow0KPi0Jc3RydWN0IGludGVsX3ZncHVfb29zX3BhZ2Ug
Km9vc19wYWdlOw0KPisJc3RydWN0IGludGVsX3ZncHVfb29zX3BhZ2UgKm9vc19wYWdlLCAqb29z
X3BhZ2VfYmFzZTsNCj4rCXN0cnVjdCBwYWdlICpjbWFfcGFnZTsNCj4rCWludCBucGFnZXM7DQo+
IAlpbnQgaTsNCj4gCWludCByZXQ7DQo+DQo+IAlJTklUX0xJU1RfSEVBRCgmZ3R0LT5vb3NfcGFn
ZV9mcmVlX2xpc3RfaGVhZCk7DQo+IAlJTklUX0xJU1RfSEVBRCgmZ3R0LT5vb3NfcGFnZV91c2Vf
bGlzdF9oZWFkKTsNCj4NCj4rCS8qIFRyeSBjbWEgYWxsb2NhdGlvbiBmaXJzdCB0byBzYXZlIHNl
dHVwIHRpbWUgKi8NCj4rCW5wYWdlcyA9IHByZWFsbG9jYXRlZF9vb3NfcGFnZXMgKiBzaXplb2Yo
Km9vc19wYWdlKTsNCj4rCW5wYWdlcyA9IERJVl9ST1VORF9VUChucGFnZXMsIFBBR0VfU0laRSk7
DQo+Kw0KPisJY21hX3BhZ2UgPSBkbWFfYWxsb2NfZnJvbV9jb250aWd1b3VzKE5VTEwsIG5wYWdl
cywgMSwgVFJVRSk7DQo+KwlpZiAoY21hX3BhZ2UpIHsNCj4rCQlvb3NfcGFnZV9iYXNlID0gcGFn
ZV9hZGRyZXNzKGNtYV9wYWdlKTsNCj4rCQltZW1zZXQob29zX3BhZ2VfYmFzZSwgMCwgbnBhZ2Vz
IDw8IFBBR0VfU0hJRlQpOw0KPisJfQ0KPisNCg0KQ3VycmVudGx5IGl0IHdpbGwgdHJ5IHRvIGNh
bGwga3phbGxvYyBmb3IgODE5MiB0aW1lcy4NClNvIGNhbiB3ZSBmaXJzdGx5IHVzZSB0aGUga2Nh
bGxvYyB0byBhbGxvY2F0ZSB0aGUgbWVtb3J5IGZvciBhbGwgdGhlICpvb3NfcGFnZSBhbmQNCnRo
ZW4gaW5pdGlhbGl6ZSB0aGUgb29zX3BhZ2UgbGlzdD8NCg0KRm9yIHRoZSBDTUE6IHdlIG5lZWQg
dG8gcmVzZXJ2ZSBzb21lIHJlZ2lvbnMgZm9yIENNQS4gVGhpcyBpcyBub3QgcmVjb21tZW5kZWQu
DQoNCj4gCWZvciAoaSA9IDA7IGkgPCBwcmVhbGxvY2F0ZWRfb29zX3BhZ2VzOyBpKyspIHsNCj4t
CQlvb3NfcGFnZSA9IGt6YWxsb2Moc2l6ZW9mKCpvb3NfcGFnZSksIEdGUF9LRVJORUwpOw0KPi0J
CWlmICghb29zX3BhZ2UpIHsNCj4tCQkJcmV0ID0gLUVOT01FTTsNCj4tCQkJZ290byBmYWlsOw0K
PisJCWlmIChjbWFfcGFnZSkgew0KPisJCQlvb3NfcGFnZSA9IG9vc19wYWdlX2Jhc2UgKyBpOw0K
PisJCX0gZWxzZSB7DQo+KwkJCW9vc19wYWdlID0ga3phbGxvYyhzaXplb2YoKm9vc19wYWdlKSwg
R0ZQX0tFUk5FTCk7DQo+KwkJCWlmICghb29zX3BhZ2UpIHsNCj4rCQkJCXJldCA9IC1FTk9NRU07
DQo+KwkJCQlnb3RvIGZhaWw7DQo+KwkJCX0NCj4gCQl9DQo+DQo+IAkJSU5JVF9MSVNUX0hFQUQo
Jm9vc19wYWdlLT5saXN0KTsNCj4tLQ0KPjIuNy40DQo+DQo+X19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCj5pbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdA0K
PmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+aHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2DQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcg
bGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
