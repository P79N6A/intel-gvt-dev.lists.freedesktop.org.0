Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3076849ywo;
        Mon, 8 Apr 2019 00:05:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwEdYnO39CP+l5cZUUbbCOUCqMNYULltKWn8428IqsZ5m9KHEt3JDKNMDMDUjjOmq7PZ5wc
X-Received: by 2002:a17:902:7481:: with SMTP id h1mr28632448pll.206.1554707150155;
        Mon, 08 Apr 2019 00:05:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554707150; cv=none;
        d=google.com; s=arc-20160816;
        b=SznP9x9X6PhNJH8QwP6DJBaohygZFDG6Fe5BEDN7zTRDnJOiWm9FT9JQyspyBTN9H7
         w0RxEjtgaqB/NoiKztjbixjuAljdoO1h7IDkNyYpMUkK/yYa6q0WhXkHYZoWh6YQD6FW
         0BLumYhaFszLn1TWtvw9C1jxzc55Rn9tn3FCSaBi3p+Me7OMnkscvo/Em0tghQkkBPlW
         j/ZUaLVPC/C+NJJJcIp3ofjeviIEVCy9gA6TrwTT7Pil09Ago2siKW179Ml8ulWBKBbz
         VAJX5farU6tIzSbD9/H6D5L+zhf0QEt8O1Fo05aoUCr32l290nshQRsnvCuSgIKPJu9y
         w1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:reply-to
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:delivered-to;
        bh=tXyBxtb366tj8/te4DfR6SnzArGa1toKzfRnQNbgCac=;
        b=fo2Pug85Qa2S31hg6GogfelsUaGKSG1KYbQYIi2WdGhInV/9Ieks5ehnFUZ7quTjp7
         GwSIsUpLb89PbEqwHADbqk/Hee443EZFld6UcGc4m/DWnALOUwigDvZipI/ANHym9D8U
         vcYfTO5m+EPhEkcix3grlKYawcB/Sz3+o68kxuLiLr66iEVw+Ti6SLy7aHa7yh5u7JY0
         exHX8Ire2cq+W9/MSbxDovdP3fYq4yNXnJPmAO23VoHO8NYM6JqNkw7TNoGZGbZh2gMV
         +EDaw1VaMXiOS/kLrhjpZoy6fA8cS9n5is8Aph1xrPpvP5tliWlNOU78zf/JUODEMOiK
         9g8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id j8si22047245pgl.577.2019.04.08.00.05.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Apr 2019 00:05:50 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F29D891FD;
	Mon,  8 Apr 2019 07:05:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28978891FD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Apr 2019 07:05:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Apr 2019 00:05:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,324,1549958400"; d="scan'208";a="313989973"
Received: from coxu-arch-shz.sh.intel.com (HELO [10.239.160.21])
 ([10.239.160.21])
 by orsmga005.jf.intel.com with ESMTP; 08 Apr 2019 00:05:46 -0700
Subject: Re: [PATCH 2/5] drm/i915/gvt: Do not copy the uninitialized pointer
 from fb_info
To: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 intel-gvt-dev@lists.freedesktop.org
References: <20190408055502.8474-1-aleksei.gimbitskii@intel.com>
 <20190408055502.8474-2-aleksei.gimbitskii@intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <e389a02a-80ec-633b-3325-df55cb83366f@intel.com>
Date: Mon, 8 Apr 2019 15:05:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190408055502.8474-2-aleksei.gimbitskii@intel.com>
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

Ck9uIDIwMTktMDQtMDggMTM6NTQsIEFsZWtzZWkgR2ltYml0c2tpaSB3cm90ZToKPiBJbiB0aGUg
Y29kZSB0aGUgbWVtY3B5KCkgZnVuY3Rpb24gY29waWVkIHVuaW5pdGlhbGl6ZWQgcG9pbnRlciBp
biBmYl9pbmZvCj4gdG8gZG1hYnVmX29iai0+aW5mby4gTGF0ZXIgdGhlIHBvaW50ZXIgaW4gZG1h
YnVmX29iai0+aW5mbyB3aWxsIGJlCj4gaW5pdGlhbGl6ZWQuIFRvIG1ha2UgdGhlIGNvZGUgYWxp
Z25lZCB3aXRoIHJlcXVpcmVtZW50cyBvZiB0aGUga2xvY3dvcmsKPiBzdGF0aWMgY29kZSBhbmFs
eXplciwgdGhlIHVuaW5pdGlhbGl6ZWQgcG9pbnRlciBzaG91bGQgYmUgaW5pdGlhbGl6ZWQKPiBi
ZWZvcmUgbWVtY3B5KCkuCj4KPiBUaGlzIHBhdGNoIGZpeGVkIHRoZSBjcml0aWNhbCBpc3N1ZSAj
NjMyIHJlcG9ydGVkIGJ5IGtsb2Nrd29yay4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsZWtzZWkgR2lt
Yml0c2tpaSA8YWxla3NlaS5naW1iaXRza2lpQGludGVsLmNvbT4KPiBDYzogWmhlbnl1IFdhbmcg
PHpoZW55dXdAbGludXguaW50ZWwuY29tPgo+IENjOiBaaGkgV2FuZyA8emhpLmEud2FuZ0BpbnRl
bC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZG1hYnVmLmMgfCA0ICsr
LS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jCj4gaW5kZXggZjZiZTk3MTE5OTY4Li5kODYwNTVj
MTQ0YzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jCj4gQEAgLTQxOCw5ICs0MTgs
OSBAQCBpbnQgaW50ZWxfdmdwdV9xdWVyeV9wbGFuZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwg
dm9pZCAqYXJncykKPiAgIAkJcmV0ID0gLUVOT01FTTsKPiAgIAkJZ290byBvdXRfZnJlZV9kbWFi
dWY7Cj4gICAJfQo+IC0JbWVtY3B5KGRtYWJ1Zl9vYmotPmluZm8sICZmYl9pbmZvLCBzaXplb2Yo
c3RydWN0IGludGVsX3ZncHVfZmJfaW5mbykpOwo+ICAgCj4gLQkoKHN0cnVjdCBpbnRlbF92Z3B1
X2ZiX2luZm8gKilkbWFidWZfb2JqLT5pbmZvKS0+b2JqID0gZG1hYnVmX29iajsKPiArCWZiX2lu
Zm8ub2JqID0gZG1hYnVmX29iajsKPiArCW1lbWNweShkbWFidWZfb2JqLT5pbmZvLCAmZmJfaW5m
bywgc2l6ZW9mKHN0cnVjdCBpbnRlbF92Z3B1X2ZiX2luZm8pKTsKPiAgIAoKU2luY2UgZG1hYnVm
X29iai0+aW5mbyBpcyBjbG9uZWQgZnJvbSBmYl9pbmZvLCBhbmQgb2JqIGlzIGFzc2lnbmVkIHRo
ZSBuZXdseSBhbGxvY2VkCmRtYWJ1Zl9vYmogaW4gdGhpcyBzYW1lIGZ1bmN0aW9uLCByZWdhcmRs
ZXNzIHdoYXQgZmJfaW5mby0+b2JqIG9yaWdpbmFsIHdhcywgd2lsbAppdCBiZSBiZXR0ZXIgdG8g
aW5pdGlhbGl6ZSBmYl9pbmZvLT5vYmogaW4gdmdwdV9nZXRfcGxhbmVfaW5mbygpIGxpa2Ugb3Ro
ZXIgbWVtYmVycz8KTGlrZSBhIHNpbXBsZSB6ZXJvLW91dCBmYl9pbmZvIGJlZm9yZSBhc3NpZ24g
bWVtYmVycywgb3IgYW4gZXhwbGljaXQgTlVMTCB0byBvYmo/Cgo+ICAgCWRtYWJ1Zl9vYmotPnZn
cHUgPSB2Z3B1Owo+ICAgCgotLSAKQmVzdCBSZWdhcmRzLApDb2xpbiBYdQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5n
IGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
