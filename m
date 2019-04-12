Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp7542584ywo;
        Thu, 11 Apr 2019 18:31:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzz+r+tuKvhRbUROaP9xdRsdO2oOcb6+UkyKYUZfsUF+PjeIq8AxaSkDj6hKkiNuqt5RaZe
X-Received: by 2002:a62:47d0:: with SMTP id p77mr53590317pfi.95.1555032697482;
        Thu, 11 Apr 2019 18:31:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555032697; cv=none;
        d=google.com; s=arc-20160816;
        b=mgE3nAZVKNGYuRRSvxIFHMSZcNYcuSEdHMr8M0Ynkmm+EnL0UZooG6IfkNlBdsEhgA
         mqNE+r2FSELfKpaIruIcQ2G04XRGqWQ4lSSWM4Ui1miGo8FwM+/X6r0OWqKZzryaQHXm
         rIlQsk0+j2rw2oYPUjmJ2E9izTJaEEGtTfNVMw0xjwjT5tGtvt5nTjDp5bxxyXhQVHOa
         tevdN0x2QoEChlUvwiB6GgNcCjIrVM8TIc75DkhMIHwTqpXDmOrJjvpLUkTvm0bjOAt6
         8xXJCWp1Ydolt/iPlfgLD5XU5pzWfaRCygaAUIJJ8N5zEGtVc65mGs7P2HuqumPpOGvV
         7cIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:reply-to
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:delivered-to;
        bh=bT+Hw0Jkd+TxQO8xTkxA+SgC4RrLmichhx8+Dx6awLs=;
        b=pDiUJ7P+ZpV6e2koDI3EVpHxPFi9Hi+DK9c8DbdP8kwqE4Ez4hE1robHDSCFxvpEF7
         Z20oRPsOdPePRI8Nsms6IKZEOw1HuOqhy5USEUpX/LL3/ylty8kL1G3pcISsHnfw+JID
         ot5HkydjimHVdOwTLxqjvLiWkLhp2lTyPphUVFwgmcEQ89nxVd9T9EWgIFObV0VRp6Rg
         GeQ9dMu/HRayVSaVEmI/XhblCD/Z1/+/pJautn0+yseavfwoTD4piOCVqD1hzVc4GySc
         CCTGsqJ9Dv87gthg/eI5QiHSNimWGZMkOyz/3bQYeMm98s8JNdsvzogNsNI47CMvN3JT
         LAFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id h2si3058946pfk.277.2019.04.11.18.31.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 18:31:37 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E019892CD;
	Fri, 12 Apr 2019 01:31:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7A4892CD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 Apr 2019 01:31:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2019 18:31:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,339,1549958400"; d="scan'208";a="148560950"
Received: from coxu-arch-shz.sh.intel.com (HELO [10.239.160.21])
 ([10.239.160.21])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Apr 2019 18:31:34 -0700
Subject: Re: [PATCH V2 2/6] drm/i915/gvt: Do not copy the uninitialized
 pointer from fb_info
To: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 intel-gvt-dev@lists.freedesktop.org
References: <20190411104631.7627-1-aleksei.gimbitskii@intel.com>
 <20190411104631.7627-3-aleksei.gimbitskii@intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <74b18c11-9220-6ed1-3665-da5fcf524c60@intel.com>
Date: Fri, 12 Apr 2019 09:31:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411104631.7627-3-aleksei.gimbitskii@intel.com>
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
Cc: Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMTktMDQtMTEgMTg6NDYsIEFsZWtzZWkgR2ltYml0c2tpaSB3cm90ZToKPiBJbiB0aGUg
Y29kZSB0aGUgbWVtY3B5KCkgZnVuY3Rpb24gY29waWVkIHVuaW5pdGlhbGl6ZWQgcG9pbnRlciBp
biBmYl9pbmZvCj4gdG8gZG1hYnVmX29iai0+aW5mby4gTGF0ZXIgdGhlIHBvaW50ZXIgaW4gZG1h
YnVmX29iai0+aW5mbyB3aWxsIGJlCj4gaW5pdGlhbGl6ZWQuIFRvIG1ha2UgdGhlIGNvZGUgYWxp
Z25lZCB3aXRoIHJlcXVpcmVtZW50cyBvZiB0aGUga2xvY3dvcmsKPiBzdGF0aWMgY29kZSBhbmFs
eXplciwgdGhlIHVuaW5pdGlhbGl6ZWQgcG9pbnRlciBzaG91bGQgYmUgaW5pdGlhbGl6ZWQKPiBi
ZWZvcmUgbWVtY3B5KCkuCj4KPiB2MjoKPiAtIEluaXRpYWxpemUgZmJfaW5mby5vYmogaW4gdmdw
dV9nZXRfcGxhbmVfaW5mbygpLiAoQ29saW4gWHUpCj4KPiBUaGlzIHBhdGNoIGZpeGVkIHRoZSBj
cml0aWNhbCBpc3N1ZSAjNjMyIHJlcG9ydGVkIGJ5IGtsb2Nrd29yay4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEFsZWtzZWkgR2ltYml0c2tpaSA8YWxla3NlaS5naW1iaXRza2lpQGludGVsLmNvbT4KPiBD
YzogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPgo+IENjOiBaaGkgV2FuZyA8
emhpLmEud2FuZ0BpbnRlbC5jb20+Cj4gQ2M6IENvbGluIFh1IDxjb2xpbi54dUBpbnRlbC5jb20+
ClJldmlld2VkLWJ5OiBDb2xpbiBYdSA8Y29saW4ueHVAaW50ZWwuY29tPgoKVGhhbmtzIGZvciB0
aGUgZml4IQo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jIHwgMiAr
Kwo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9kbWFidWYuYwo+IGluZGV4IGY2YmU5NzExOTk2OC4uODJlYjM5YzA5YTIxIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9kbWFidWYuYwo+IEBAIC0yMTEsNiArMjExLDggQEAgc3RhdGljIGludCB2
Z3B1X2dldF9wbGFuZV9pbmZvKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gICAJc3RydWN0IGlu
dGVsX3ZncHVfY3Vyc29yX3BsYW5lX2Zvcm1hdCBjOwo+ICAgCWludCByZXQ7Cj4gICAKPiArCW1l
bXNldChpbmZvLCAwLCBzaXplb2YoKmluZm8pKTsKPiArCj4gICAJaWYgKHBsYW5lX2lkID09IERS
TV9QTEFORV9UWVBFX1BSSU1BUlkpIHsKPiAgIAkJcmV0ID0gaW50ZWxfdmdwdV9kZWNvZGVfcHJp
bWFyeV9wbGFuZSh2Z3B1LCAmcCk7Cj4gICAJCWlmIChyZXQpCgotLSAKQmVzdCBSZWdhcmRzLApD
b2xpbiBYdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRl
bC1ndnQtZGV2
