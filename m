Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp338748ywb;
        Thu, 21 Mar 2019 23:31:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy4dy4oTKG6HMn5R79J9CQXOwhwGVX/ZAg47xJ7jWVRlW0XwQPokoojOM1XtzFi0Yur29EU
X-Received: by 2002:a63:c242:: with SMTP id l2mr7339630pgg.138.1553236270673;
        Thu, 21 Mar 2019 23:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553236270; cv=none;
        d=google.com; s=arc-20160816;
        b=EQK3g8p6gRsypf7+8E4qSq0ME3z5MRshhjRWospfUjLKlf+JO2erHXKTMD04AMYlzM
         WleQ7QLKi5u3UcrvoKQ5NiJzfRLKGsaEv7oQCIxMSZukBJvpRfI96dCwDjY6drRMa+5Z
         VLwVeB0LkxxM+fiwxX8jlbhihgIdL+Jm5EACaNBsJR8vnMNvO/GPQqn8J/4uny43r/3B
         rNBfz7VwaQI6mA9vneOdwv3uCV+NTBXb+0DxjtTEXjcH68NaBHppKuhXxIJ93UY20j+F
         ae9HcLT7nH0z6Vs3FlNnKNwl1DsrVjyJeWeIAbxQcYR5jIy/9M8VsVF+iKxtBMiN0N6j
         ZPsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:reply-to
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:delivered-to;
        bh=rSWwlkOSsR+2WuOVjmBBHtRT2qxepIe+ZDf7mAeDEsk=;
        b=0eJ/CcBckXANGwep1JyXy05AF4422oaQTmD72rcla3bCRLbXezC2SoPCopE4eMTAuH
         wrCE7gmxf2oruA6JkQAk5yrbcappOVJjhje0awY+E+Xr1Wr0WOwIrFuL08uMwLUHn9HW
         fCYZFccapZIJIy/TavpXdG8EnnIpR86PVlriIQVdlfs1duOr9az7DPHTbmIvDPTNEiF9
         Izfi7viWqlPZ6ar1Fl9CcbgvGq8I9QR9neEuUBQTaHYE1TV2h53rx2dI4aXf1pIbAD3A
         epLBay7f2N1/DAwS408R5on7VaA/lMZE6msdM55HFpC1liql6c0pRXCxuqC5TjUGO50Q
         5QaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id q13si5852268pgv.157.2019.03.21.23.31.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2019 23:31:10 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482196E24E;
	Fri, 22 Mar 2019 06:31:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CBF6E24E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 22 Mar 2019 06:31:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Mar 2019 23:31:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,255,1549958400"; d="scan'208";a="142841223"
Received: from coxu-arch-shz.sh.intel.com (HELO [10.239.160.24])
 ([10.239.160.24])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Mar 2019 23:31:07 -0700
Subject: Re: [PATCH 1/6] drm/i915/gvt: Prevent invalid array index access to
 vgpu->fence.regs[]
To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <20190320032130.9817-1-colin.xu@intel.com>
 <20190320032130.9817-2-colin.xu@intel.com>
 <20190322061654.GR10798@zhen-hp.sh.intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <8b9b4f56-b2b1-eb48-a43c-f79b920b82a7@intel.com>
Date: Fri, 22 Mar 2019 14:31:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <20190322061654.GR10798@zhen-hp.sh.intel.com>
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

Ck9uIDMvMjIvMTkgMjoxNiBQTSwgWmhlbnl1IFdhbmcgd3JvdGU6Cj4gT24gMjAxOS4wMy4yMCAx
MToyMToyNSArMDgwMCwgQ29saW4gWHUgd3JvdGU6Cj4+IEludmFsaWQgaW5kZXggY291bGQgcmVz
dWx0IGluIGFycmF5IG92ZXJmbG93IHNvIGxpbWl0IGl0IHRvIGFycmF5IHNpemUuCj4+IEFsdGhv
dWdoIHRoZXNlIGFjY2VzcyBhcmUgcHJvdGVjdGVkIGJ5IGN1cnJlbnQgZ3Z0IGxvZ2ljIGFuZCB3
b24ndCBoaXQKPj4gZHVyaW5nIHJ1bm5pbmcsIGJ1dCBzdGlsbCBoYXMgcG90ZW50aWFsIHNlY3Vy
aXR5IHJpc2sgaW4gZnV0dXJlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBYdSA8Y29saW4u
eHVAaW50ZWwuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvYXBlcnR1
cmVfZ20uYyB8IDMgKystCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2Fw
ZXJ0dXJlX2dtLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvYXBlcnR1cmVfZ20uYwo+PiBp
bmRleCAxZmEyZjY1YzNjZDEuLmVjMTRkNzUwNjExNCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2FwZXJ0dXJlX2dtLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2FwZXJ0dXJlX2dtLmMKPj4gQEAgLTEzMyw3ICsxMzMsOCBAQCB2b2lkIGludGVsX3Zn
cHVfd3JpdGVfZmVuY2Uoc3RydWN0IGludGVsX3ZncHUgKnZncHUsCj4+ICAgCj4+ICAgCWFzc2Vy
dF9ycG1fd2FrZWxvY2tfaGVsZChkZXZfcHJpdik7Cj4+ICAgCj4+IC0JaWYgKFdBUk5fT04oZmVu
Y2UgPj0gdmdwdV9mZW5jZV9zeih2Z3B1KSkpCj4+ICsJaWYgKFdBUk5fT04oZmVuY2UgPj0gdmdw
dV9mZW5jZV9zeih2Z3B1KSB8fAo+PiArCQkgICAgZmVuY2UgPj0gSU5URUxfR1ZUX01BWF9OVU1f
RkVOQ0VTKSkKPj4gICAJCXJldHVybjsKPiBMb29rcyB1bm5lY2Vzc2FyeSBhcyB2R1BVIHdvbid0
IHVzZSBtb3JlIHRoYW4gbWF4IGZlbmNlcy4KVGhleSBhcmUga2xvY3dvcmsgZXJyb3JzIGFuZCBj
cml0aWFscy4gQWxsIHRoZXNlIHdhcm5pbmdzIHdvbid0IGhpdCBpbiAKcmVhbCBlbnZpcm9ubWVu
dC4KPj4gICAKPj4gICAJcmVnID0gdmdwdS0+ZmVuY2UucmVnc1tmZW5jZV07Cj4+IC0tIAo+PiAy
LjIxLjAKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPj4gaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKPj4gaW50ZWwtZ3Z0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pbnRlbC1ndnQtZGV2Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0Cj4gaW50ZWwtZ3Z0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYKCi0tIApCZXN0IFJlZ2FyZHMsCkNvbGlu
IFh1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRl
bC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2
dC1kZXY=
