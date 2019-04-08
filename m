Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3091676ywo;
        Mon, 8 Apr 2019 00:26:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy2G3IapAbc1texixYbCDe0bLZ10qePQmdlqGfNG/SsqB3eb+sLYnZtNcnJu2KKeVXEXVgW
X-Received: by 2002:a63:3fc3:: with SMTP id m186mr27675460pga.151.1554708397704;
        Mon, 08 Apr 2019 00:26:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554708397; cv=none;
        d=google.com; s=arc-20160816;
        b=dK4BoktspUs7cR4pVz5jVCnah8fup03N6HCM6YIgCk/DKmT0tqWbppqH3JaKhKJ4Xd
         +lvsaxUGbbbwqIpiA88aWJ3XNgqt9bvQw76n+6EBNkHZB0bvmTuVJ2uBJUAbWzWOZKoG
         XYeVZAZtA/Cuz+WlSSYV50jW6V9argftmOm7I6DI66d0X0X3+m2+rZ9GMKaSEd7DORsu
         /g/AkOOrbvNMxR1pAP+bPNIuCy+AAFfMSPu4+ve4q6Ay3fpQ5MG/WbIqC8D4bQFtemeW
         fDHUrrDWy/Jv1WnPAQXzaLoKtYYoKCd/LO9qRDOqlpIUoiMi7bPV8r5iJFOZWgvTSZ84
         tiNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:reply-to
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:delivered-to;
        bh=VnRLXo7klNx4TWqIwWsBsEa7kndAJeLmxiYZj9Nq/+U=;
        b=EQDUY5Fax+UXQWUbemoyvKB200G3XhJ6tTS0kqKvFZW1Jo0aZ/t+xqULjt4bLFPzYc
         wQYr1EQwDowWMPHRLiu/o7Dq+sHIDVbkya4m6RxR33DF4JsINfkty5r8WtC2PjhbkHUv
         Vnb7tiOTIACH/x3XPOn5Yy0Igu7ATse20NAPc56I8caWWDLOJL91MALX1nogHiKFwgPg
         uOtreDLAOaiDfWYFEpcEnJfEztgs+o5KfsZifzX2TCtJhTl4ytH1/w9jRyQx/4mBxImJ
         78SwxMSMTU+RQ+7nbF74T9yliLODJ+oKT7/DHmJiGRbFHZcARv5VtPWPJf9ZJVlyKh6p
         s5+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id t10si25938862pga.315.2019.04.08.00.26.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Apr 2019 00:26:37 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B908938F;
	Mon,  8 Apr 2019 07:26:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA2689232
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Apr 2019 07:26:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Apr 2019 00:26:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,324,1549958400"; d="scan'208";a="313994734"
Received: from coxu-arch-shz.sh.intel.com (HELO [10.239.160.21])
 ([10.239.160.21])
 by orsmga005.jf.intel.com with ESMTP; 08 Apr 2019 00:26:33 -0700
Subject: Re: [PATCH 4/5] drm/i915/gvt: Check if cur_pt_type is valid
To: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 intel-gvt-dev@lists.freedesktop.org
References: <20190408055502.8474-1-aleksei.gimbitskii@intel.com>
 <20190408055502.8474-4-aleksei.gimbitskii@intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <eb907c6f-0b0f-d730-4f47-83ec640efbdc@intel.com>
Date: Mon, 8 Apr 2019 15:26:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190408055502.8474-4-aleksei.gimbitskii@intel.com>
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

Ck9uIDIwMTktMDQtMDggMTM6NTUsIEFsZWtzZWkgR2ltYml0c2tpaSB3cm90ZToKPiBTdGF0aWMg
Y29kZSBhbmFseXplciB3YXJucyB0aGF0IGluZGV4IHZhbHVlIGZvciBzY3JhdGNoX3B0IG1heSBi
ZSBlcXVhbAo+IHRvIC0xLiBJbmRleCB2YWx1ZSB0eXBlIGlzIGludGVsX2d2dF9ndHRfdHlwZV90
LCBzbyBpdCBtYXkgYmUgYW55IG51bWJlcgo+IGF0IHJhbmdlIC0xIHRvIDE3LiBDaGVjayBmaXJz
dCBpZiBjdXJfcHRfdHlwZSBhbmQgY3VyX3B0X3R5cGUrMSBpcyB2YWxpZAo+IHZhbHVlcy4KPgo+
IFRoaXMgcGF0Y2ggZml4ZWQgdGhlIGNyaXRpYWwgaXNzdWUgIzQyMiByZXBvcnRlZCBieSBrbG9j
d29yay4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsZWtzZWkgR2ltYml0c2tpaSA8YWxla3NlaS5naW1i
aXRza2lpQGludGVsLmNvbT4KPiBDYzogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwu
Y29tPgo+IENjOiBaaGkgV2FuZyA8emhpLmEud2FuZ0BpbnRlbC5jb20+Cj4gLS0tCj4gICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgfCA5ICsrKysrKysrLQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQu
Ywo+IGluZGV4IDhkY2I2MjIzYjk4NS4uN2RjMDliMzg5ZTU5IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9ndHQuYwo+IEBAIC05MzYsNyArOTM2LDE0IEBAIHN0YXRpYyBpbnQgcHBndHRfaW52YWxpZGF0
ZV9zcHRfYnlfc2hhZG93X2VudHJ5KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LAo+ICAgCj4gICAJ
aWYgKGUtPnR5cGUgIT0gR1RUX1RZUEVfUFBHVFRfUk9PVF9MM19FTlRSWQo+ICAgCQkmJiBlLT50
eXBlICE9IEdUVF9UWVBFX1BQR1RUX1JPT1RfTDRfRU5UUlkpIHsKPiAtCQljdXJfcHRfdHlwZSA9
IGdldF9uZXh0X3B0X3R5cGUoZS0+dHlwZSkgKyAxOwo+ICsJCWN1cl9wdF90eXBlID0gZ2V0X25l
eHRfcHRfdHlwZShlLT50eXBlKTsKPiArCj4gKwkJaWYgKCFndHRfdHlwZV9pc19wdChjdXJfcHRf
dHlwZSkgfHwKPiArCQkJCSFndHRfdHlwZV9pc19wdChjdXJfcHRfdHlwZSArIDEpKQo+ICsJCQly
ZXR1cm4gLUVJTlZBTDsKCkl0J3MgYmV0dGVyIHRvIGxlYXZlIHNvbWUgZGJnbXNnIGZvciBpbnZh
bGlkIHR5cGUuCgo+ICsKPiArCQljdXJfcHRfdHlwZSArPSAxOwo+ICsKPiAgIAkJaWYgKG9wcy0+
Z2V0X3BmbihlKSA9PQo+ICAgCQkJdmdwdS0+Z3R0LnNjcmF0Y2hfcHRbY3VyX3B0X3R5cGVdLnBh
Z2VfbWZuKQo+ICAgCQkJcmV0dXJuIDA7CgotLSAKQmVzdCBSZWdhcmRzLApDb2xpbiBYdQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRl
diBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
