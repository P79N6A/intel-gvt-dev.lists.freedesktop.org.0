Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp7540934ywo;
        Thu, 11 Apr 2019 18:29:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz6yIGGWc3yjZhVsvozzVuIq6wJ4k8paCRr/t0dwI70NW1w369pJrHqJzVSUXNkDk2ch4Xq
X-Received: by 2002:a63:cc0c:: with SMTP id x12mr50372342pgf.336.1555032569200;
        Thu, 11 Apr 2019 18:29:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555032569; cv=none;
        d=google.com; s=arc-20160816;
        b=QgzFyy/842826sFzlO5ctjLy3pAY+HtbvOusOuOSCMGbRrQV4I0g2Dq73cEOFp3wx+
         IT5VHoXSVC+c0Wq4kEfWp6rccDhz7Y2xCul/hRQDe50rbUSLwtLAcYMHtXqzFRFlaNB9
         oOvxUC3J+ciojGgwadzJw8nt18H5zybHB7cVxqBIJFTTJsbq9UpcV8i7w0S5X+8fpoyC
         YD+JBnRnSeAroN1TYhIpY+/l+BYAbZcVeKSVwXvV+p+rRoBrvnQL8hpWlb8m/0HSnO76
         JGI6LrO/AEELMXy7FNX04CVyid6v9dCLdYNaBhMAIy/VgAZ+F7oEM9WwjedYuZ8HvVPt
         iYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:reply-to
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:delivered-to;
        bh=r0NWPU7aTqpT5ZmC4vtFTgPsoz9mn1OGOJX3ZdZRhpk=;
        b=ubmSn6I4Hi2wfazvAPTTYDJgyHhxkLz/BNSmul5rKD15j+n2Ap73hdDJwyxJIjDnIs
         wEh328TNI8iyt/AGWZwgAJ5YznnwkZDKhT7jvgDbM2Z/uxLvbOK5jVhyYhoMIDyUHYvg
         oqJ5DBsSsNoS66t/cNruR/lHwZJbOLLOtSAC9Nwwn8kXIsTDyEEllNBVJEVoGGPkbaEr
         48MexO2JNLPoREvHgpidJD3ebdw5cnc1PlUUbJnBqvY8OfO4sgD0EPSV/xI2cvzRl2so
         76/vZP1deaoGhddZYWSuHsulxM2O+G15aGyvRg+EgvjtMMJTXqkENPkAzRn1988rNe6m
         sZqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id k6si34934060pgq.300.2019.04.11.18.29.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 18:29:29 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68510892BB;
	Fri, 12 Apr 2019 01:29:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE20892BB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 Apr 2019 01:29:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2019 18:29:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,339,1549958400"; d="scan'208";a="148560435"
Received: from coxu-arch-shz.sh.intel.com (HELO [10.239.160.21])
 ([10.239.160.21])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Apr 2019 18:29:24 -0700
Subject: Re: [PATCH V2 1/6] drm/i915/gvt: Remove typedef intel_gvt_gtt_type_t
To: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
References: <20190411104631.7627-1-aleksei.gimbitskii@intel.com>
 <20190411104631.7627-2-aleksei.gimbitskii@intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <91e9a249-f15d-b5cd-a718-51097de4637f@intel.com>
Date: Fri, 12 Apr 2019 09:29:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411104631.7627-2-aleksei.gimbitskii@intel.com>
Content-Language: en-US
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
Reply-To: Colin.Xu@intel.com
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

U2VlbXMgbGlrZSBWMiBvZiB0aGlzIHBhdGNoIGRvZXNuJ3QgZ2V0IHVwZGF0ZWQ/CgpIaSBaaGks
IFpoZW55dSwgZnJvbSBhcmNoaXRlY3R1cmUgcG9pbnQgb2Ygdmlldywgd2hhdCBraW5kIG9mIGNo
YW5nZSBpcyBiZXR0ZXI/Ci0gQ2hhbmdlIHBhcmFtZXRlciB0eXBlIGZyb20gZW51bSB0eXBlIHRv
IGludCBsb29rcyAiY2hlYXQiIGtsb2N3b3JrIHN0YXRpYyBhbmFseXNpcywKYnV0IGxvc2UgbmF0
dXJhbCBwcm90ZWN0aW9uIHNpbmNlIGFueSBpbnQgY291bGQgYmUgcGFzc2VkIGludG8gdGhlIGZ1
bmN0aW9uLgotIElmIHdlIGtlZXAgdXNpbmcgZW51bSB0eXBlIGFzIHRoZSBmdW5jdGlvbiBwYXJh
bWV0ZXIsIHdlIG1heSBuZWVkIGV4dHJhY3QgY2hlY2sKc28gdGhhdCBrbG9jd29yayBzdGF0aWMg
YW5hbHlzaXMgd2lsbCBjb25zaWRlciBhcyBzYWZlLgpBbnkgY29tbWVudHM/IEkgcHJlZmVyIHRo
ZSBsYXR0ZXIuCgpPbiAyMDE5LTA0LTExIDE4OjQ2LCBBbGVrc2VpIEdpbWJpdHNraWkgd3JvdGU6
Cj4gVGhlIGtsb2N3b3JrIHN0YXRpYyBjb2RlIGFuYWx5emVyIHRha2VzIHRoZSBlbnVtZXJhdGlv
biBhcyB0aGUgZnVsbCByYW5nZQo+IG9mIGludGVsX2d2dF9ndHRfdHlwZV90LiBCdXQgdGhlIGZ1
bGwgcmFuZ2Ugb2YgaW50ZWxfZ3Z0X2d0dF90eXBlX3Qgd2lsbAo+IG5ldmVyIGJlIHVzZWQgaW4g
ZnVsbCByYW5nZS4gRm9yIGV4YW1wbGUsIHRoZSBHVFRfVFlQRV9JTlZBTElEIHdpbGwgbmV2ZXIK
PiBiZSB1c2VkIGFzIGFuIGluZGV4IG9mIGFuIGFycmF5LiBTbyB3ZSB3aWxsIG5vdCB1c2UgaXQg
YXMgYSB0eXBlIGJ1dCBvbmx5Cj4gdGhlIGVudW1lcmF0aW9uLgo+Cj4gVGhpcyBwYXRjaCBmaXhl
ZCB0aGUgY3JpdGlhbCBpc3N1ZXMgIzQ4MywgIzU1MSwgIzY2NSByZXBvcnRlZCBieQo+IGtsb2Nr
d29yay4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsZWtzZWkgR2ltYml0c2tpaSA8YWxla3NlaS5naW1i
aXRza2lpQGludGVsLmNvbT4KPiBDYzogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwu
Y29tPgo+IENjOiBaaGkgV2FuZyA8emhpLmEud2FuZ0BpbnRlbC5jb20+Cj4gLS0tCj4gICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgfCAxMiArKysrKystLS0tLS0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9ndHQuaCB8IDE0ICsrKysrKystLS0tLS0tCj4gICAyIGZpbGVzIGNo
YW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9ndHQuYwo+IGluZGV4IDg4ZWQyZTlkZjI1My4uOGRjYjYyMjNiOTg1IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9ndHQuYwo+IEBAIC04MDUsNyArODA1LDcgQEAgc3RhdGljIGludCByZWNsYWltX29u
ZV9wcGd0dF9tbShzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQpOwo+ICAgCj4gICAvKiBBbGxvY2F0ZSBz
aGFkb3cgcGFnZSB0YWJsZSB3aXRob3V0IGd1ZXN0IHBhZ2UuICovCj4gICBzdGF0aWMgc3RydWN0
IGludGVsX3ZncHVfcHBndHRfc3B0ICpwcGd0dF9hbGxvY19zcHQoCj4gLQkJc3RydWN0IGludGVs
X3ZncHUgKnZncHUsIGludGVsX2d2dF9ndHRfdHlwZV90IHR5cGUpCj4gKwkJc3RydWN0IGludGVs
X3ZncHUgKnZncHUsIGludCB0eXBlKQo+ICAgewo+ICAgCXN0cnVjdCBkZXZpY2UgKmtkZXYgPSAm
dmdwdS0+Z3Z0LT5kZXZfcHJpdi0+ZHJtLnBkZXYtPmRldjsKPiAgIAlzdHJ1Y3QgaW50ZWxfdmdw
dV9wcGd0dF9zcHQgKnNwdCA9IE5VTEw7Cj4gQEAgLTg1NSw3ICs4NTUsNyBAQCBzdGF0aWMgc3Ry
dWN0IGludGVsX3ZncHVfcHBndHRfc3B0ICpwcGd0dF9hbGxvY19zcHQoCj4gICAKPiAgIC8qIEFs
bG9jYXRlIHNoYWRvdyBwYWdlIHRhYmxlIGFzc29jaWF0ZWQgd2l0aCBzcGVjaWZpYyBnZm4uICov
Cj4gICBzdGF0aWMgc3RydWN0IGludGVsX3ZncHVfcHBndHRfc3B0ICpwcGd0dF9hbGxvY19zcHRf
Z2ZuKAo+IC0JCXN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCBpbnRlbF9ndnRfZ3R0X3R5cGVfdCB0
eXBlLAo+ICsJCXN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCBpbnQgdHlwZSwKPiAgIAkJdW5zaWdu
ZWQgbG9uZyBnZm4sIGJvb2wgZ3Vlc3RfcGRlX2lwcykKPiAgIHsKPiAgIAlzdHJ1Y3QgaW50ZWxf
dmdwdV9wcGd0dF9zcHQgKnNwdDsKPiBAQCAtOTMwLDcgKzkzMCw3IEBAIHN0YXRpYyBpbnQgcHBn
dHRfaW52YWxpZGF0ZV9zcHRfYnlfc2hhZG93X2VudHJ5KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1
LAo+ICAgewo+ICAgCXN0cnVjdCBpbnRlbF9ndnRfZ3R0X3B0ZV9vcHMgKm9wcyA9IHZncHUtPmd2
dC0+Z3R0LnB0ZV9vcHM7Cj4gICAJc3RydWN0IGludGVsX3ZncHVfcHBndHRfc3B0ICpzOwo+IC0J
aW50ZWxfZ3Z0X2d0dF90eXBlX3QgY3VyX3B0X3R5cGU7Cj4gKwlpbnQgY3VyX3B0X3R5cGU7Cj4g
ICAKPiAgIAlHRU1fQlVHX09OKCFndHRfdHlwZV9pc19wdChnZXRfbmV4dF9wdF90eXBlKGUtPnR5
cGUpKSk7Cj4gICAKPiBAQCAtMTg0OSw3ICsxODQ5LDcgQEAgc3RhdGljIHZvaWQgdmdwdV9mcmVl
X21tKHN0cnVjdCBpbnRlbF92Z3B1X21tICptbSkKPiAgICAqIFplcm8gb24gc3VjY2VzcywgbmVn
YXRpdmUgZXJyb3IgY29kZSBpbiBwb2ludGVyIGlmIGZhaWxlZC4KPiAgICAqLwo+ICAgc3RydWN0
IGludGVsX3ZncHVfbW0gKmludGVsX3ZncHVfY3JlYXRlX3BwZ3R0X21tKHN0cnVjdCBpbnRlbF92
Z3B1ICp2Z3B1LAo+IC0JCWludGVsX2d2dF9ndHRfdHlwZV90IHJvb3RfZW50cnlfdHlwZSwgdTY0
IHBkcHNbXSkKPiArCQlpbnQgcm9vdF9lbnRyeV90eXBlLCB1NjQgcGRwc1tdKQo+ICAgewo+ICAg
CXN0cnVjdCBpbnRlbF9ndnQgKmd2dCA9IHZncHUtPmd2dDsKPiAgIAlzdHJ1Y3QgaW50ZWxfdmdw
dV9tbSAqbW07Cj4gQEAgLTIzMDMsNyArMjMwMyw3IEBAIGludCBpbnRlbF92Z3B1X2VtdWxhdGVf
Z2d0dF9tbWlvX3dyaXRlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LAo+ICAgfQo+ICAgCj4gICBz
dGF0aWMgaW50IGFsbG9jX3NjcmF0Y2hfcGFnZXMoc3RydWN0IGludGVsX3ZncHUgKnZncHUsCj4g
LQkJaW50ZWxfZ3Z0X2d0dF90eXBlX3QgdHlwZSkKPiArCQlpbnQgdHlwZSkKPiAgIHsKPiAgIAlz
dHJ1Y3QgaW50ZWxfdmdwdV9ndHQgKmd0dCA9ICZ2Z3B1LT5ndHQ7Cj4gICAJc3RydWN0IGludGVs
X2d2dF9ndHRfcHRlX29wcyAqb3BzID0gdmdwdS0+Z3Z0LT5ndHQucHRlX29wczsKPiBAQCAtMjU4
OCw3ICsyNTg4LDcgQEAgc3RydWN0IGludGVsX3ZncHVfbW0gKmludGVsX3ZncHVfZmluZF9wcGd0
dF9tbShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwKPiAgICAqIFplcm8gb24gc3VjY2VzcywgbmVn
YXRpdmUgZXJyb3IgY29kZSBpZiBmYWlsZWQuCj4gICAgKi8KPiAgIHN0cnVjdCBpbnRlbF92Z3B1
X21tICppbnRlbF92Z3B1X2dldF9wcGd0dF9tbShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwKPiAt
CQlpbnRlbF9ndnRfZ3R0X3R5cGVfdCByb290X2VudHJ5X3R5cGUsIHU2NCBwZHBzW10pCj4gKwkJ
aW50IHJvb3RfZW50cnlfdHlwZSwgdTY0IHBkcHNbXSkKPiAgIHsKPiAgIAlzdHJ1Y3QgaW50ZWxf
dmdwdV9tbSAqbW07Cj4gICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2d0dC5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5oCj4gaW5kZXggMzJjNTczYWVh
NDk0Li42NDVkZGMxYmQyMjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2d0dC5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5oCj4gQEAgLTk1LDcg
Kzk1LDcgQEAgc3RydWN0IGludGVsX2d2dF9ndHQgewo+ICAgCXVuc2lnbmVkIGxvbmcgc2NyYXRj
aF9tZm47Cj4gICB9Owo+ICAgCj4gLXR5cGVkZWYgZW51bSB7Cj4gK2VudW0gewo+ICAgCUdUVF9U
WVBFX0lOVkFMSUQgPSAtMSwKPiAgIAo+ICAgCUdUVF9UWVBFX0dHVFRfUFRFLAo+IEBAIC0xMjQs
NyArMTI0LDcgQEAgdHlwZWRlZiBlbnVtIHsKPiAgIAlHVFRfVFlQRV9QUEdUVF9QTUw0X1BULAo+
ICAgCj4gICAJR1RUX1RZUEVfTUFYLAo+IC19IGludGVsX2d2dF9ndHRfdHlwZV90Owo+ICt9Owo+
ICAgCj4gICBlbnVtIGludGVsX2d2dF9tbV90eXBlIHsKPiAgIAlJTlRFTF9HVlRfTU1fR0dUVCwK
PiBAQCAtMTQ4LDcgKzE0OCw3IEBAIHN0cnVjdCBpbnRlbF92Z3B1X21tIHsKPiAgIAo+ICAgCXVu
aW9uIHsKPiAgIAkJc3RydWN0IHsKPiAtCQkJaW50ZWxfZ3Z0X2d0dF90eXBlX3Qgcm9vdF9lbnRy
eV90eXBlOwo+ICsJCQlpbnQgcm9vdF9lbnRyeV90eXBlOwo+ICAgCQkJLyoKPiAgIAkJCSAqIFRo
ZSA0IFBEUHMgaW4gcmluZyBjb250ZXh0LiBGb3IgNDhiaXQgYWRkcmVzc2luZywKPiAgIAkJCSAq
IG9ubHkgUERQMCBpcyB2YWxpZCBhbmQgcG9pbnQgdG8gUE1MNC4gRm9yIDMyaXQKPiBAQCAtMTY5
LDcgKzE2OSw3IEBAIHN0cnVjdCBpbnRlbF92Z3B1X21tIHsKPiAgIH07Cj4gICAKPiAgIHN0cnVj
dCBpbnRlbF92Z3B1X21tICppbnRlbF92Z3B1X2NyZWF0ZV9wcGd0dF9tbShzdHJ1Y3QgaW50ZWxf
dmdwdSAqdmdwdSwKPiAtCQlpbnRlbF9ndnRfZ3R0X3R5cGVfdCByb290X2VudHJ5X3R5cGUsIHU2
NCBwZHBzW10pOwo+ICsJCWludCByb290X2VudHJ5X3R5cGUsIHU2NCBwZHBzW10pOwo+ICAgCj4g
ICBzdGF0aWMgaW5saW5lIHZvaWQgaW50ZWxfdmdwdV9tbV9nZXQoc3RydWN0IGludGVsX3ZncHVf
bW0gKm1tKQo+ICAgewo+IEBAIC0yMzMsNyArMjMzLDcgQEAgc3RydWN0IGludGVsX3ZncHVfcHBn
dHRfc3B0IHsKPiAgIAlzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdTsKPiAgIAo+ICAgCXN0cnVjdCB7
Cj4gLQkJaW50ZWxfZ3Z0X2d0dF90eXBlX3QgdHlwZTsKPiArCQlpbnQgdHlwZTsKPiAgIAkJYm9v
bCBwZGVfaXBzOyAvKiBmb3IgNjRLQiBQVEVzICovCj4gICAJCXZvaWQgKnZhZGRyOwo+ICAgCQlz
dHJ1Y3QgcGFnZSAqcGFnZTsKPiBAQCAtMjQxLDcgKzI0MSw3IEBAIHN0cnVjdCBpbnRlbF92Z3B1
X3BwZ3R0X3NwdCB7Cj4gICAJfSBzaGFkb3dfcGFnZTsKPiAgIAo+ICAgCXN0cnVjdCB7Cj4gLQkJ
aW50ZWxfZ3Z0X2d0dF90eXBlX3QgdHlwZTsKPiArCQlpbnQgdHlwZTsKPiAgIAkJYm9vbCBwZGVf
aXBzOyAvKiBmb3IgNjRLQiBQVEVzICovCj4gICAJCXVuc2lnbmVkIGxvbmcgZ2ZuOwo+ICAgCQl1
bnNpZ25lZCBsb25nIHdyaXRlX2NudDsKPiBAQCAtMjY3LDcgKzI2Nyw3IEBAIHN0cnVjdCBpbnRl
bF92Z3B1X21tICppbnRlbF92Z3B1X2ZpbmRfcHBndHRfbW0oc3RydWN0IGludGVsX3ZncHUgKnZn
cHUsCj4gICAJCXU2NCBwZHBzW10pOwo+ICAgCj4gICBzdHJ1Y3QgaW50ZWxfdmdwdV9tbSAqaW50
ZWxfdmdwdV9nZXRfcHBndHRfbW0oc3RydWN0IGludGVsX3ZncHUgKnZncHUsCj4gLQkJaW50ZWxf
Z3Z0X2d0dF90eXBlX3Qgcm9vdF9lbnRyeV90eXBlLCB1NjQgcGRwc1tdKTsKPiArCQlpbnQgcm9v
dF9lbnRyeV90eXBlLCB1NjQgcGRwc1tdKTsKPiAgIAo+ICAgaW50IGludGVsX3ZncHVfcHV0X3Bw
Z3R0X21tKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1NjQgcGRwc1tdKTsKPiAgIAoKLS0gCkJl
c3QgUmVnYXJkcywKQ29saW4gWHUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
