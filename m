Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3063649ywo;
        Sun, 7 Apr 2019 23:48:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzEJhzPUc3c1KAIGfzsW1d+CUhLMaqKeYmdfK/Aisyr9lWqMPC7VG3TEw5dTVdkska8vI8d
X-Received: by 2002:a65:414a:: with SMTP id x10mr27006949pgp.237.1554706091068;
        Sun, 07 Apr 2019 23:48:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554706091; cv=none;
        d=google.com; s=arc-20160816;
        b=mWDoxo9MlFff0fbR2UiviY1oJzDG8vYC0yjDvbls5GJf7cxojfqonZLlvx3ct6V/OO
         1AhPwXdGfet0vxBj6cWFnIviEzWNTMT9dzuGOjNZtGuIrCnEbr4OpvMeF4XaTH9Qt4ji
         vEmAAd6c/BfFwmqIf3Di8hrdyUFLHJJ7FCS9oy1GtJh5QVORqhl0Cn+ipstd/IPu2EiK
         SjSlvu+g6dNqs8FwCx4moBmTzJ0NYTXopsbM5cIfzZy+W67b64olO6R/ZSUyY0o0nWGT
         9s/aJ2WKIgIkUD03n3+2kMKfBPOe0BQQ5JecuuZ9tstl+2eowVyrLUnuqEmIjKjtnDGg
         exMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:reply-to
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:delivered-to;
        bh=Sdv/FMVMHYNINx5d+LMJk/lWvAG1YnUEQKGZFxo7dcA=;
        b=paJQ5LN7xy9zXwEz4nb72vM5vx5wKjWNN8f7gHpA5MPAkkZ2CrRPaAsygWe3cNxeu5
         zJHjIlMPaRe5RGav7kdpaxXPrwmWXuBDlv2JlQF5H7e8nXX6+TjuEnBatH9eBRtfSftO
         MyAnAa8HFTND0QTD/5QN/Z572+X5VvYZtVH1fT8fkDRzqUwAA1Uq6DAwBlF85j47xzqX
         /tZgw+O5++iZvYFSM+Zu5Yyie9aCQrS3qMKtP3TGTaosg/7TQXck80Ly4WPqDVz7kMoA
         coru4unwxU8lIsJG4zmrEyUDFLXVThexuYIB0Xwq9KLaV6rGM7j+g+g7gHY+9L1VKy//
         HIfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id w125si26894615pfw.137.2019.04.07.23.48.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Apr 2019 23:48:11 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF6188E33;
	Mon,  8 Apr 2019 06:48:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24A688E33
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Apr 2019 06:48:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Apr 2019 23:48:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,324,1549958400"; d="scan'208";a="313985528"
Received: from coxu-arch-shz.sh.intel.com (HELO [10.239.160.21])
 ([10.239.160.21])
 by orsmga005.jf.intel.com with ESMTP; 07 Apr 2019 23:48:06 -0700
Subject: Re: [PATCH 1/5] drm/i915/gvt: Remove typedef intel_gvt_gtt_type_t
To: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 intel-gvt-dev@lists.freedesktop.org
References: <20190408055502.8474-1-aleksei.gimbitskii@intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <499afd08-90f9-6021-c126-acaab61cf4e5@intel.com>
Date: Mon, 8 Apr 2019 14:48:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190408055502.8474-1-aleksei.gimbitskii@intel.com>
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
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

QmV0dGVyIGhhdmUgYSBjb3Zlci1sZXR0ZXIgZm9yIGEgcGF0Y2ggc2V0LgoKT24gMjAxOS0wNC0w
OCAxMzo1NCwgQWxla3NlaSBHaW1iaXRza2lpIHdyb3RlOgo+IFRoZSBrbG9jd29yayBzdGF0aWMg
Y29kZSBhbmFseXplciB0YWtlcyB0aGUgZW51bWVyYXRpb24gYXMgdGhlIGZ1bGwgcmFuZ2UKPiBv
ZiBpbnRlbF9ndnRfZ3R0X3R5cGVfdC4gQnV0IHRoZSBmdWxsIHJhbmdlIG9mIGludGVsX2d2dF9n
dHRfdHlwZV90IHdpbGwKPiBuZXZlciBiZSB1c2VkIGluIGZ1bGwgcmFuZ2UuIEZvciBleGFtcGxl
LCB0aGUgR1RUX1RZUEVfSU5WQUxJRCB3aWxsIG5ldmVyCj4gYmUgdXNlZCBhcyBhbiBpbmRleCBv
ZiBhbiBhcnJheS4gU28gd2Ugd2lsbCBub3QgdXNlIGl0IGFzIGEgdHlwZSBidXQgb25seQo+IHRo
ZSBlbnVtZXJhdGlvbi4KPgo+IFRoaXMgcGF0Y2ggZml4ZWQgdGhlIGNyaXRpYWwgaXNzdWVzICM0
ODMsICM1NTEsICM2NjUgcmVwb3J0ZWQgYnkKPiBrbG9ja3dvcmsuCgpDaGFuZ2luZyBmdW5jdGlv
biBwYXJhbSBmcm9tIGludGVsX2d2dF9ndHRfdHlwZV90IHRvIGludCBkb2Vzbid0IGFjdHVhbGx5
IGF2b2lkCmFuIGludmFsaWQgaW5kZXggaW50byB0aGUgYXJyYXkuIElmIHRoZSBjYWxsZXIgcGFz
cyBhbiBpbnZhbGlkIHR5cGUsIGluZGV4aW5nCnRvIHNjcmF0Y2hfcHQgY291bGQgc3RpbGwgb3Zl
cmZsb3cuIENvbXBhcmVkIHdpdGggaW50LCBlbnVtIGNhbiBwcm92aWRlIG5hdHVyYWwKcHJvdGVj
dGlvbiBieSBvbmx5IGFsbG93IHBvc3NpYmxlIHZhbHVlcy4KQmV0dGVyIGZpbmQgYW5vdGhlciB3
YXkgdG8gc29sdmUgdGhlIGlzc3Vlcy4KCj4gU2lnbmVkLW9mZi1ieTogQWxla3NlaSBHaW1iaXRz
a2lpIDxhbGVrc2VpLmdpbWJpdHNraWlAaW50ZWwuY29tPgo+IENjOiBaaGVueXUgV2FuZyA8emhl
bnl1d0BsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IFpoaSBXYW5nIDx6aGkuYS53YW5nQGludGVsLmNv
bT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyB8IDEyICsrKysrKy0t
LS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5oIHwgMTQgKysrKysrKy0tLS0t
LS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCj4gaW5kZXggODhlZDJlOWRmMjUzLi44ZGNiNjIyM2I5
ODUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCj4gQEAgLTgwNSw3ICs4MDUsNyBAQCBzdGF0
aWMgaW50IHJlY2xhaW1fb25lX3BwZ3R0X21tKHN0cnVjdCBpbnRlbF9ndnQgKmd2dCk7Cj4gICAK
PiAgIC8qIEFsbG9jYXRlIHNoYWRvdyBwYWdlIHRhYmxlIHdpdGhvdXQgZ3Vlc3QgcGFnZS4gKi8K
PiAgIHN0YXRpYyBzdHJ1Y3QgaW50ZWxfdmdwdV9wcGd0dF9zcHQgKnBwZ3R0X2FsbG9jX3NwdCgK
PiAtCQlzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgaW50ZWxfZ3Z0X2d0dF90eXBlX3QgdHlwZSkK
PiArCQlzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgaW50IHR5cGUpCj4gICB7Cj4gICAJc3RydWN0
IGRldmljZSAqa2RldiA9ICZ2Z3B1LT5ndnQtPmRldl9wcml2LT5kcm0ucGRldi0+ZGV2Owo+ICAg
CXN0cnVjdCBpbnRlbF92Z3B1X3BwZ3R0X3NwdCAqc3B0ID0gTlVMTDsKPiBAQCAtODU1LDcgKzg1
NSw3IEBAIHN0YXRpYyBzdHJ1Y3QgaW50ZWxfdmdwdV9wcGd0dF9zcHQgKnBwZ3R0X2FsbG9jX3Nw
dCgKPiAgIAo+ICAgLyogQWxsb2NhdGUgc2hhZG93IHBhZ2UgdGFibGUgYXNzb2NpYXRlZCB3aXRo
IHNwZWNpZmljIGdmbi4gKi8KPiAgIHN0YXRpYyBzdHJ1Y3QgaW50ZWxfdmdwdV9wcGd0dF9zcHQg
KnBwZ3R0X2FsbG9jX3NwdF9nZm4oCj4gLQkJc3RydWN0IGludGVsX3ZncHUgKnZncHUsIGludGVs
X2d2dF9ndHRfdHlwZV90IHR5cGUsCj4gKwkJc3RydWN0IGludGVsX3ZncHUgKnZncHUsIGludCB0
eXBlLAo+ICAgCQl1bnNpZ25lZCBsb25nIGdmbiwgYm9vbCBndWVzdF9wZGVfaXBzKQo+ICAgewo+
ICAgCXN0cnVjdCBpbnRlbF92Z3B1X3BwZ3R0X3NwdCAqc3B0Owo+IEBAIC05MzAsNyArOTMwLDcg
QEAgc3RhdGljIGludCBwcGd0dF9pbnZhbGlkYXRlX3NwdF9ieV9zaGFkb3dfZW50cnkoc3RydWN0
IGludGVsX3ZncHUgKnZncHUsCj4gICB7Cj4gICAJc3RydWN0IGludGVsX2d2dF9ndHRfcHRlX29w
cyAqb3BzID0gdmdwdS0+Z3Z0LT5ndHQucHRlX29wczsKPiAgIAlzdHJ1Y3QgaW50ZWxfdmdwdV9w
cGd0dF9zcHQgKnM7Cj4gLQlpbnRlbF9ndnRfZ3R0X3R5cGVfdCBjdXJfcHRfdHlwZTsKPiArCWlu
dCBjdXJfcHRfdHlwZTsKPiAgIAo+ICAgCUdFTV9CVUdfT04oIWd0dF90eXBlX2lzX3B0KGdldF9u
ZXh0X3B0X3R5cGUoZS0+dHlwZSkpKTsKPiAgIAo+IEBAIC0xODQ5LDcgKzE4NDksNyBAQCBzdGF0
aWMgdm9pZCB2Z3B1X2ZyZWVfbW0oc3RydWN0IGludGVsX3ZncHVfbW0gKm1tKQo+ICAgICogWmVy
byBvbiBzdWNjZXNzLCBuZWdhdGl2ZSBlcnJvciBjb2RlIGluIHBvaW50ZXIgaWYgZmFpbGVkLgo+
ICAgICovCj4gICBzdHJ1Y3QgaW50ZWxfdmdwdV9tbSAqaW50ZWxfdmdwdV9jcmVhdGVfcHBndHRf
bW0oc3RydWN0IGludGVsX3ZncHUgKnZncHUsCj4gLQkJaW50ZWxfZ3Z0X2d0dF90eXBlX3Qgcm9v
dF9lbnRyeV90eXBlLCB1NjQgcGRwc1tdKQo+ICsJCWludCByb290X2VudHJ5X3R5cGUsIHU2NCBw
ZHBzW10pCj4gICB7Cj4gICAJc3RydWN0IGludGVsX2d2dCAqZ3Z0ID0gdmdwdS0+Z3Z0Owo+ICAg
CXN0cnVjdCBpbnRlbF92Z3B1X21tICptbTsKPiBAQCAtMjMwMyw3ICsyMzAzLDcgQEAgaW50IGlu
dGVsX3ZncHVfZW11bGF0ZV9nZ3R0X21taW9fd3JpdGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUs
Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyBpbnQgYWxsb2Nfc2NyYXRjaF9wYWdlcyhzdHJ1Y3QgaW50
ZWxfdmdwdSAqdmdwdSwKPiAtCQlpbnRlbF9ndnRfZ3R0X3R5cGVfdCB0eXBlKQo+ICsJCWludCB0
eXBlKQo+ICAgewo+ICAgCXN0cnVjdCBpbnRlbF92Z3B1X2d0dCAqZ3R0ID0gJnZncHUtPmd0dDsK
PiAgIAlzdHJ1Y3QgaW50ZWxfZ3Z0X2d0dF9wdGVfb3BzICpvcHMgPSB2Z3B1LT5ndnQtPmd0dC5w
dGVfb3BzOwo+IEBAIC0yNTg4LDcgKzI1ODgsNyBAQCBzdHJ1Y3QgaW50ZWxfdmdwdV9tbSAqaW50
ZWxfdmdwdV9maW5kX3BwZ3R0X21tKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LAo+ICAgICogWmVy
byBvbiBzdWNjZXNzLCBuZWdhdGl2ZSBlcnJvciBjb2RlIGlmIGZhaWxlZC4KPiAgICAqLwo+ICAg
c3RydWN0IGludGVsX3ZncHVfbW0gKmludGVsX3ZncHVfZ2V0X3BwZ3R0X21tKHN0cnVjdCBpbnRl
bF92Z3B1ICp2Z3B1LAo+IC0JCWludGVsX2d2dF9ndHRfdHlwZV90IHJvb3RfZW50cnlfdHlwZSwg
dTY0IHBkcHNbXSkKPiArCQlpbnQgcm9vdF9lbnRyeV90eXBlLCB1NjQgcGRwc1tdKQo+ICAgewo+
ICAgCXN0cnVjdCBpbnRlbF92Z3B1X21tICptbTsKPiAgIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmgK
PiBpbmRleCAzMmM1NzNhZWE0OTQuLjY0NWRkYzFiZDIyMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
Z3R0LmgKPiBAQCAtOTUsNyArOTUsNyBAQCBzdHJ1Y3QgaW50ZWxfZ3Z0X2d0dCB7Cj4gICAJdW5z
aWduZWQgbG9uZyBzY3JhdGNoX21mbjsKPiAgIH07Cj4gICAKPiAtdHlwZWRlZiBlbnVtIHsKPiAr
ZW51bSB7Cj4gICAJR1RUX1RZUEVfSU5WQUxJRCA9IC0xLAo+ICAgCj4gICAJR1RUX1RZUEVfR0dU
VF9QVEUsCj4gQEAgLTEyNCw3ICsxMjQsNyBAQCB0eXBlZGVmIGVudW0gewo+ICAgCUdUVF9UWVBF
X1BQR1RUX1BNTDRfUFQsCj4gICAKPiAgIAlHVFRfVFlQRV9NQVgsCj4gLX0gaW50ZWxfZ3Z0X2d0
dF90eXBlX3Q7Cj4gK307Cj4gICAKPiAgIGVudW0gaW50ZWxfZ3Z0X21tX3R5cGUgewo+ICAgCUlO
VEVMX0dWVF9NTV9HR1RULAo+IEBAIC0xNDgsNyArMTQ4LDcgQEAgc3RydWN0IGludGVsX3ZncHVf
bW0gewo+ICAgCj4gICAJdW5pb24gewo+ICAgCQlzdHJ1Y3Qgewo+IC0JCQlpbnRlbF9ndnRfZ3R0
X3R5cGVfdCByb290X2VudHJ5X3R5cGU7Cj4gKwkJCWludCByb290X2VudHJ5X3R5cGU7Cj4gICAJ
CQkvKgo+ICAgCQkJICogVGhlIDQgUERQcyBpbiByaW5nIGNvbnRleHQuIEZvciA0OGJpdCBhZGRy
ZXNzaW5nLAo+ICAgCQkJICogb25seSBQRFAwIGlzIHZhbGlkIGFuZCBwb2ludCB0byBQTUw0LiBG
b3IgMzJpdAo+IEBAIC0xNjksNyArMTY5LDcgQEAgc3RydWN0IGludGVsX3ZncHVfbW0gewo+ICAg
fTsKPiAgIAo+ICAgc3RydWN0IGludGVsX3ZncHVfbW0gKmludGVsX3ZncHVfY3JlYXRlX3BwZ3R0
X21tKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LAo+IC0JCWludGVsX2d2dF9ndHRfdHlwZV90IHJv
b3RfZW50cnlfdHlwZSwgdTY0IHBkcHNbXSk7Cj4gKwkJaW50IHJvb3RfZW50cnlfdHlwZSwgdTY0
IHBkcHNbXSk7Cj4gICAKPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBpbnRlbF92Z3B1X21tX2dldChz
dHJ1Y3QgaW50ZWxfdmdwdV9tbSAqbW0pCj4gICB7Cj4gQEAgLTIzMyw3ICsyMzMsNyBAQCBzdHJ1
Y3QgaW50ZWxfdmdwdV9wcGd0dF9zcHQgewo+ICAgCXN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1Owo+
ICAgCj4gICAJc3RydWN0IHsKPiAtCQlpbnRlbF9ndnRfZ3R0X3R5cGVfdCB0eXBlOwo+ICsJCWlu
dCB0eXBlOwo+ICAgCQlib29sIHBkZV9pcHM7IC8qIGZvciA2NEtCIFBURXMgKi8KPiAgIAkJdm9p
ZCAqdmFkZHI7Cj4gICAJCXN0cnVjdCBwYWdlICpwYWdlOwo+IEBAIC0yNDEsNyArMjQxLDcgQEAg
c3RydWN0IGludGVsX3ZncHVfcHBndHRfc3B0IHsKPiAgIAl9IHNoYWRvd19wYWdlOwo+ICAgCj4g
ICAJc3RydWN0IHsKPiAtCQlpbnRlbF9ndnRfZ3R0X3R5cGVfdCB0eXBlOwo+ICsJCWludCB0eXBl
Owo+ICAgCQlib29sIHBkZV9pcHM7IC8qIGZvciA2NEtCIFBURXMgKi8KPiAgIAkJdW5zaWduZWQg
bG9uZyBnZm47Cj4gICAJCXVuc2lnbmVkIGxvbmcgd3JpdGVfY250Owo+IEBAIC0yNjcsNyArMjY3
LDcgQEAgc3RydWN0IGludGVsX3ZncHVfbW0gKmludGVsX3ZncHVfZmluZF9wcGd0dF9tbShzdHJ1
Y3QgaW50ZWxfdmdwdSAqdmdwdSwKPiAgIAkJdTY0IHBkcHNbXSk7Cj4gICAKPiAgIHN0cnVjdCBp
bnRlbF92Z3B1X21tICppbnRlbF92Z3B1X2dldF9wcGd0dF9tbShzdHJ1Y3QgaW50ZWxfdmdwdSAq
dmdwdSwKPiAtCQlpbnRlbF9ndnRfZ3R0X3R5cGVfdCByb290X2VudHJ5X3R5cGUsIHU2NCBwZHBz
W10pOwo+ICsJCWludCByb290X2VudHJ5X3R5cGUsIHU2NCBwZHBzW10pOwo+ICAgCj4gICBpbnQg
aW50ZWxfdmdwdV9wdXRfcHBndHRfbW0oc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHU2NCBwZHBz
W10pOwo+ICAgCgotLSAKQmVzdCBSZWdhcmRzLApDb2xpbiBYdQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QK
aW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
