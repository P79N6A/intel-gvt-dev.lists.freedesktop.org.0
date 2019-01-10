Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp1769069ywd;
        Thu, 10 Jan 2019 05:07:27 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5r+eW3E78V+WyOn/P7830TE7TBesVOSzpN+ZPO55SNk38Cq0PExzBIiBPjOVAEqvtBiIh6
X-Received: by 2002:a65:4ccb:: with SMTP id n11mr9456278pgt.257.1547125647148;
        Thu, 10 Jan 2019 05:07:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547125647; cv=none;
        d=google.com; s=arc-20160816;
        b=o1s4xRxUOJziHt9ChfVM0RN4Jkh3ADnRFzcYemtH6idEUWHma3FVpyjQ5lTVGQahYV
         oM/e2QUsOQ2kDa7OKikoWkLE9vKbc9IBPSNRwR2wdjKevfQDzO+nvXEMpUxUKxQLN+p0
         H/xU/B3iv3HEf9xcPPtVSeSaQkuk3jdUbv9kcaFvVbimRNI3uDxqeW6ZLOlnIXZqgAYk
         uiRFW5Rlyv6jCfd5HysbdKfeVy/fc/pq6V4CcE5gJBrnbA9SVD6AzhHfMllLgYbQtLaC
         Aq6lzJW2Skg8thZh4jMP6MjMr5Fp4cnC+rgy3GZGHL8pt+J0JrxvD892mw3Z2nW39eSl
         my6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:message-id:date:references:organization
         :in-reply-to:subject:to:from:delivered-to;
        bh=tW3ZmnJexlwEBVU6tINNCl2a4faEkRzluAUrAexqpiE=;
        b=Pzd5gHwON9/KjoYFLgtRnsQtBQ+Xrr7ildz45SddOK+hLRK2bwkmrADErVoQKh6tuc
         piLAPVGtyA6wzl2ph799mgAf+Su0CwTHjyp9oTQoZ7UGHljbAP+lh+Mk/o8zEwIqoNZk
         7bN781GbCCOt1B88yNwqcr5NSTDtdF5x5U1YMNLwzP3G1wXmSVLOBndLjetwhPVUr8iM
         RJKp8b5rFUSs6+PAJid5TVyryx0ywdnDEMzMjbPFwbO8fB6+rY0SQFh1nwwzDhnHor5W
         rN6YXfI3TYv6lIdYFA9+46b2XeAmclWkJn50oCXjjDtQL5kbTDD22dVVSrYcLdv0aUMV
         QXPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id i190si44090927pfc.116.2019.01.10.05.07.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Jan 2019 05:07:27 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284F76F318;
	Thu, 10 Jan 2019 13:07:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8666F318;
 Thu, 10 Jan 2019 13:07:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2019 05:07:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,461,1539673200"; d="scan'208";a="137081028"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.72.79])
 by fmsmga001.fm.intel.com with ESMTP; 10 Jan 2019 05:07:21 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PULL] gvt-fixes for 5.0-rc2
In-Reply-To: <20190109050151.GL11631@zhen-hp.sh.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190109050151.GL11631@zhen-hp.sh.intel.com>
Date: Thu, 10 Jan 2019 15:09:03 +0200
Message-ID: <87a7k87j80.fsf@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCAwOSBKYW4gMjAxOSwgWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29t
PiB3cm90ZToKPiBIaSwKPgo+IEhlcmUncyBvbmUgcmFjZSBmaXggZm9yIGd2dCB0byBoYW5kbGUg
cmVxdWVzdCBwcm9wZXJseQo+IGJldHdlZW4gcHJlLXNjYW4gb2Ygd29ya2xvYWQgYW5kIHN1Ym1p
c3Npb24uCgpQdWxsZWQsIHRoYW5rcy4KCkJSLApKYW5pLgoKPgo+IFRoYW5rcy4KPiAtLQo+IFRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYmZlZmZkMTU1MjgzNzcyYmJlNzhjNmEw
NWRlYzdjMDEyOGVlNTAwYzoKPgo+ICAgTGludXggNS4wLXJjMSAoMjAxOS0wMS0wNiAxNzowODoy
MCAtMDgwMCkKPgo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+Cj4g
ICBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvZ3Z0LWxpbnV4LmdpdCB0YWdzL2d2dC1maXhlcy0y
MDE5LTAxLTA5Cj4KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZjBlOTk0MzcyNTE4
NmRkYmRjOTcxOGE1NTljMjZjNWY1MDcyNjJmMjoKPgo+ICAgZHJtL2k5MTUvZ3Z0OiBGaXggd29y
a2xvYWQgcmVxdWVzdCBhbGxvY2F0aW9uIGJlZm9yZSByZXF1ZXN0IGFkZCAoMjAxOS0wMS0wOSAx
Mjo1OTowOSArMDgwMCkKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBndnQtZml4ZXMtMjAxOS0wMS0wOQo+Cj4gLSBG
aXggb25lIHJhY2UgaXNzdWUgYmV0d2VlbiBwcmUtc2NhbiBvZiBndWVzdCB3b3JrbG9hZCB3aXRo
IHN1Ym1pc3Npb24KPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBaaGVueXUgV2FuZyAoMSk6Cj4gICAgICAgZHJtL2k5
MTUvZ3Z0OiBGaXggd29ya2xvYWQgcmVxdWVzdCBhbGxvY2F0aW9uIGJlZm9yZSByZXF1ZXN0IGFk
ZAo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYyB8IDY0ICsrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
c2NoZWR1bGVyLmggfCAgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwg
MjIgZGVsZXRpb25zKC0pCgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBo
aWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lu
dGVsLWd2dC1kZXYK
