Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp3065407ywd;
        Mon, 28 Jan 2019 02:19:29 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5/m8MQBGTVVRZ5mBthUE5kYglyf4uCBBJwke0tCRsNENIh8j06UIrP3sHEUvxncXRommaM
X-Received: by 2002:a62:546:: with SMTP id 67mr20876994pff.99.1548670769695;
        Mon, 28 Jan 2019 02:19:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548670769; cv=none;
        d=google.com; s=arc-20160816;
        b=0Zw0/3ON79r6P5BcMQ8lF/7xOzN6qJYpCJLaCND+vT1fdvLiVIcksveNwG3JwVjwb1
         KQFSU+TR9M8KquasJZwSIQ95masnELWtzvG+3m73A9vEXDCedK1PnX6tDyv8NJh0gvh1
         AVRk8wn/RMMipLxk1gI15uSUqgAfd4bs6Z3NXseUHqEvaUg1roJZDgOMQD3FKSAVDTMn
         vXBvpEIyE52FT7NZdVH+yztgR8Zq1HTLTtHh6qNrDe9gDu+i5Obw7xBsGdcaO41QBMkf
         WqsRh+nutoDVVQqr5UPsUHZ8Z/EjYU0mJ2Mdfr/xBHJ4l/yKCc9Zh4WZePb5TnupUc3n
         4R0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:content-language:in-reply-to:mime-version:user-agent
         :date:message-id:from:references:to:subject:delivered-to;
        bh=xRRY5mgcEhql8ZpIAnUHrmGJzQb1by5LkXtNMSoDk+c=;
        b=gil33Yr2te85tfRtOk2QqKd/bMFKmi1I8UaKjGrHS4clLme7ypcW0V7yR5XRqDXK7P
         ofB/4r/HwGjyL8XoDjI2S06NzBM/wqVhl+0T0HbYs1uodRnfsr/wIhsToi/USxcnCKOV
         7KyD8a91YGqsEf2LzAD6I1tTJt5hfqCB6pbMqeHEY4cBCfr1Vz6bz8Grcg/N/EfiU2Y8
         kU7K4u9WnIfo6sMEOX8Zr4/BwLknXal55IabIuvhgZnV4BExVX6PKfzKYGsgJLsglYkY
         kX4SM7P/byxzUVYxu09teYq+cZ/spiRLeSjmBIJValA5sh6cWKvA4AmcTDjC3qBodNaN
         2S6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id c10si13479873pgw.294.2019.01.28.02.19.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jan 2019 02:19:29 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E126E430;
	Mon, 28 Jan 2019 10:19:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174F46E431
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 28 Jan 2019 10:19:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2019 02:19:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,533,1539673200"; d="scan'208";a="120033456"
Received: from henry-optiplex-7050.bj.intel.com (HELO [10.238.157.81])
 ([10.238.157.81])
 by fmsmga008.fm.intel.com with ESMTP; 28 Jan 2019 02:19:25 -0800
Subject: Re: [PATCH v2 3/3] drm/i915/gvt: add VFIO EDID region
To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <1548308797-3109-1-git-send-email-hang.yuan@linux.intel.com>
 <1548308797-3109-4-git-send-email-hang.yuan@linux.intel.com>
 <20190125051600.GT7203@zhen-hp.sh.intel.com>
From: Hang Yuan <hang.yuan@linux.intel.com>
Message-ID: <1551234f-a8fa-a2b0-f2b5-7d15f2ba77e1@linux.intel.com>
Date: Mon, 28 Jan 2019 18:12:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190125051600.GT7203@zhen-hp.sh.intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gMS8yNS8xOSAxOjE2IFBNLCBaaGVueXUgV2FuZyB3cm90ZToKPiBPbiAyMDE5LjAxLjI0IDEz
OjQ2OjM3ICswODAwLCBoYW5nLnl1YW5AbGludXguaW50ZWwuY29tIHdyb3RlOgo+PiBGcm9tOiBI
YW5nIFl1YW4gPGhhbmcueXVhbkBsaW51eC5pbnRlbC5jb20+Cj4+Cj4+IEltcGxlbWVudCBWRklP
IEVESUQgcmVnaW9uIGZvciB2Z3B1LiBTdXBwb3J0IEVESUQgYmxvYiB1cGRhdGUgYW5kIG5vdGlm
eQo+PiBndWVzdCBvbiBsaW5rIHN0YXRlIGNoYW5nZSB2aWEgaG90cGx1ZyBldmVudC4KPj4KPj4g
djI6IGFkZCBFRElEIHNhbml0eSBjaGVjayBhbmQgc2l6ZSB1cGRhdGUgPHpoZW55dT4KPj4KPj4g
VGVzdGVkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPj4gU2lnbmVkLW9m
Zi1ieTogSGFuZyBZdWFuIDxoYW5nLnl1YW5AbGludXguaW50ZWwuY29tPgo+PiAtLS0KPiAKPiBM
b29rcyBmaW5lIHRvIG1lLCBzb21lIGxpdHRsZSBjb21tZW50cyBiZWxvdy4KPiAKPj4gICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmggICAgICAgfCAgIDcgKysKPj4gICBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvaHlwZXJjYWxsLmggfCAgIDEgKwo+PiAgIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9rdm1ndC5jICAgICB8IDEzOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+PiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tcHQuaCAgICAgICB8ICAxNyArKysr
Kwo+PiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmMgICAgICB8ICAgNiArKwo+PiAg
IDUgZmlsZXMgY2hhbmdlZCwgMTY5IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9n
dnQuaAo+PiBpbmRleCA4YmNlMDlkLi41NzkzNjE5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvZ3Z0LmgKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2
dC5oCj4+IEBAIC0xMjcsNiArMTI3LDEzIEBAIHN0cnVjdCBpbnRlbF92Z3B1X29wcmVnaW9uIHsK
Pj4gICAKPj4gICAjZGVmaW5lIHZncHVfb3ByZWdpb24odmdwdSkgKCYodmdwdS0+b3ByZWdpb24p
KQo+PiAgIAo+PiArI2lmIElTX0VOQUJMRUQoQ09ORklHX0RSTV9JOTE1X0dWVF9LVk1HVCkKPj4g
KwlzdHJ1Y3QgaW50ZWxfdmdwdV9lZGlkX3JlZ2lvbiB7Cj4+ICsJCXN0cnVjdCB2ZmlvX3JlZ2lv
bl9nZnhfZWRpZCB2ZmlvX2VkaWRfcmVnczsKPj4gKwkJdm9pZCAqZWRpZF9ibG9iOwo+PiArCX07
Cj4+ICsjZW5kaWYKPiAKPiBJIHRoaW5rIGJldHRlciBqdXN0IG1vdmUgdGhpcyBpbiBrdm1ndC5j
IGl0c2VsZiB3aGljaCBpcyBvbmx5IHVzZWQgdGhlcmUuCkhlbnJ5OiBXaWxsIGFkZHJlc3MgaXQg
aW4gbmV4dCB2ZXJzaW9uLiBUaGFua3MuCgo+PiArCj4+ICAgc3RydWN0IGludGVsX3ZncHVfZGlz
cGxheSB7Cj4+ICAgCXN0cnVjdCBpbnRlbF92Z3B1X2kyY19lZGlkIGkyY19lZGlkOwo+PiAgIAlz
dHJ1Y3QgaW50ZWxfdmdwdV9wb3J0IHBvcnRzW0k5MTVfTUFYX1BPUlRTXTsKPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oeXBlcmNhbGwuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9oeXBlcmNhbGwuaAo+PiBpbmRleCA4MzFhYjM0Li40ODYyZmIxIDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaHlwZXJjYWxsLmgKPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2h5cGVyY2FsbC5oCj4+IEBAIC02Nyw2ICs2Nyw3IEBAIHN0
cnVjdCBpbnRlbF9ndnRfbXB0IHsKPj4gICAJaW50ICgqc2V0X3RyYXBfYXJlYSkodW5zaWduZWQg
bG9uZyBoYW5kbGUsIHU2NCBzdGFydCwgdTY0IGVuZCwKPj4gICAJCQkgICAgIGJvb2wgbWFwKTsK
Pj4gICAJaW50ICgqc2V0X29wcmVnaW9uKSh2b2lkICp2Z3B1KTsKPj4gKwlpbnQgKCpzZXRfZWRp
ZCkodm9pZCAqdmdwdSwgaW50IHBvcnRfbnVtKTsKPj4gICAJaW50ICgqZ2V0X3ZmaW9fZGV2aWNl
KSh2b2lkICp2Z3B1KTsKPj4gICAJdm9pZCAoKnB1dF92ZmlvX2RldmljZSkodm9pZCAqdmdwdSk7
Cj4+ICAgCWJvb2wgKCppc192YWxpZF9nZm4pKHVuc2lnbmVkIGxvbmcgaGFuZGxlLCB1bnNpZ25l
ZCBsb25nIGdmbik7Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3Zt
Z3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jCj4+IGluZGV4IDViZWMwYjUu
LmFlODhmMTcgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5j
Cj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jCj4+IEBAIC01Nyw2ICs1
Nyw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW50ZWxfZ3Z0X29wcyAqaW50ZWxfZ3Z0X29wczsK
Pj4gICAjZGVmaW5lIFZGSU9fUENJX0lOREVYX1RPX09GRlNFVChpbmRleCkgKCh1NjQpKGluZGV4
KSA8PCBWRklPX1BDSV9PRkZTRVRfU0hJRlQpCj4+ICAgI2RlZmluZSBWRklPX1BDSV9PRkZTRVRf
TUFTSyAgICAoKCh1NjQpKDEpIDw8IFZGSU9fUENJX09GRlNFVF9TSElGVCkgLSAxKQo+PiAgIAo+
PiArI2RlZmluZSBFRElEX0JMT0JfT0ZGU0VUIChQQUdFX1NJWkUvMikKPj4gKwo+PiAgICNkZWZp
bmUgT1BSRUdJT05fU0lHTkFUVVJFICJJbnRlbEdyYXBoaWNzTWVtIgo+PiAgIAo+PiAgIHN0cnVj
dCB2ZmlvX3JlZ2lvbjsKPj4gQEAgLTQyNyw2ICs0MjksMTExIEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgaW50ZWxfdmdwdV9yZWdvcHMgaW50ZWxfdmdwdV9yZWdvcHNfb3ByZWdpb24gPSB7Cj4+ICAg
CS5yZWxlYXNlID0gaW50ZWxfdmdwdV9yZWdfcmVsZWFzZV9vcHJlZ2lvbiwKPj4gICB9Owo+PiAg
IAo+PiArc3RhdGljIGludCBoYW5kbGVfZWRpZF9yZWdzKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1
LAo+PiArCQkJc3RydWN0IGludGVsX3ZncHVfZWRpZF9yZWdpb24gKnJlZ2lvbiwgY2hhciAqYnVm
LAo+PiArCQkJc2l6ZV90IGNvdW50LCB1MTYgb2Zmc2V0LCBib29sIGlzX3dyaXRlKQo+PiArewo+
PiArCXN0cnVjdCB2ZmlvX3JlZ2lvbl9nZnhfZWRpZCAqcmVncyA9ICZyZWdpb24tPnZmaW9fZWRp
ZF9yZWdzOwo+PiArCXVuc2lnbmVkIGludCBkYXRhOwo+PiArCj4+ICsJaWYgKG9mZnNldCArIGNv
dW50ID4gc2l6ZW9mKCpyZWdzKSkKPj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4+ICsKPj4gKwlpZiAo
Y291bnQgIT0gNCkKPj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4+ICsKPj4gKwlpZiAoaXNfd3JpdGUp
IHsKPj4gKwkJZGF0YSA9ICooKHVuc2lnbmVkIGludCAqKWJ1Zik7Cj4+ICsJCXN3aXRjaCAob2Zm
c2V0KSB7Cj4+ICsJCWNhc2Ugb2Zmc2V0b2Yoc3RydWN0IHZmaW9fcmVnaW9uX2dmeF9lZGlkLCBs
aW5rX3N0YXRlKToKPj4gKwkJCWlmIChkYXRhID09IFZGSU9fREVWSUNFX0dGWF9MSU5LX1NUQVRF
X1VQKSB7Cj4+ICsJCQkJaWYgKCFkcm1fZWRpZF9ibG9ja192YWxpZCgKPj4gKwkJCQkJKHU4ICop
cmVnaW9uLT5lZGlkX2Jsb2IsCj4+ICsJCQkJCTAsCj4+ICsJCQkJCXRydWUsCj4+ICsJCQkJCU5V
TEwpKSB7Cj4+ICsJCQkJCWd2dF92Z3B1X2VycigiaW52YWxpZCBFRElEIGJsb2JcbiIpOwo+PiAr
CQkJCQlyZXR1cm4gLUVJTlZBTDsKPj4gKwkJCQl9Cj4gCj4gTWlnaHQganVzdCB3cml0ZSBpZiAo
ZGF0YSA9PSAuLi5TVEFURV9VUCAmJiAhZHJtX2VkaWRfYmxvY2tfdmFsaWQoLi4uKSkgcmV0dXJu
IC1FSU5WQUw7CkhlbnJ5OiBTb3VuZHMgbGlrZSBpdCB3aWxsIG5vdCByZWR1Y2UgdGhlIG51bWJl
ciBvZiAnaWYnLiBUaGVuIHN0aWxsIApuZWVkIHRvIGNoZWNrIGlmIChkYXRhID09IC4uLlNUQVRF
X1VQICYmIGRybV9lZGlkX2Jsb2NrX3ZhbGlkKC4uLikpIAplbXVsYXRlX2hvdHBsdWcoKTsKCj4+
ICsJCQkJaW50ZWxfZ3Z0X29wcy0+ZW11bGF0ZV9ob3RwbHVnKHZncHUsIHRydWUpOwo+PiArCQkJ
fSBlbHNlIGlmIChkYXRhID09IFZGSU9fREVWSUNFX0dGWF9MSU5LX1NUQVRFX0RPV04pCj4+ICsJ
CQkJaW50ZWxfZ3Z0X29wcy0+ZW11bGF0ZV9ob3RwbHVnKHZncHUsIGZhbHNlKTsKPj4gKwkJCWVs
c2Ugewo+PiArCQkJCWd2dF92Z3B1X2VycigiaW52YWxpZCBFRElEIGxpbmsgc3RhdGUgJWRcbiIs
Cj4+ICsJCQkJCXJlZ3MtPmxpbmtfc3RhdGUpOwo+PiArCQkJCXJldHVybiAtRUlOVkFMOwo+PiAr
CQkJfQo+PiArCQkJcmVncy0+bGlua19zdGF0ZSA9IGRhdGE7Cj4+ICsJCQlicmVhazsKPj4gKwkJ
Y2FzZSBvZmZzZXRvZihzdHJ1Y3QgdmZpb19yZWdpb25fZ2Z4X2VkaWQsIGVkaWRfc2l6ZSk6Cj4+
ICsJCQlpZiAoZGF0YSA+IHJlZ3MtPmVkaWRfbWF4X3NpemUpIHsKPj4gKwkJCQlndnRfdmdwdV9l
cnIoIkVESUQgc2l6ZSBpcyBiaWdnZXIgdGhhbiAlZCFcbiIsCj4+ICsJCQkJCXJlZ3MtPmVkaWRf
bWF4X3NpemUpOwo+PiArCQkJCXJldHVybiAtRUlOVkFMOwo+PiArCQkJfQo+PiArCQkJcmVncy0+
ZWRpZF9zaXplID0gZGF0YTsKPj4gKwkJCWJyZWFrOwo+PiArCQlkZWZhdWx0Ogo+PiArCQkJLyog
cmVhZC1vbmx5IHJlZ3MgKi8KPj4gKwkJCWd2dF92Z3B1X2Vycigid3JpdGUgcmVhZC1vbmx5IEVE
SUQgcmVnaW9uIGF0IG9mZnNldCAlZFxuIiwKPj4gKwkJCQlvZmZzZXQpOwo+PiArCQkJcmV0dXJu
IC1FUEVSTTsKPj4gKwkJfQo+PiArCX0gZWxzZSB7Cj4+ICsJCW1lbWNweShidWYsIChjaGFyICop
cmVncyArIG9mZnNldCwgY291bnQpOwo+PiArCX0KPj4gKwo+PiArCXJldHVybiBjb3VudDsKPj4g
K30KPj4gKwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
bnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVs
LWd2dC1kZXYK
