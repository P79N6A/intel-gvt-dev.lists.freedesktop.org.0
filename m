Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp348179ywb;
        Tue, 19 Mar 2019 23:46:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxZyg6jP6nSktJ29mQQ4zmAkJ0Kcw0k86jneyV+CtXNTvVnaNyF/UXYLaJ8ol7/srDEkHk1
X-Received: by 2002:a17:902:850c:: with SMTP id bj12mr6096942plb.69.1553064398767;
        Tue, 19 Mar 2019 23:46:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553064398; cv=none;
        d=google.com; s=arc-20160816;
        b=EsiboQ7Jnj+8DE2QTp0yorKrqZeCVGX7utfJy+OP9YlDdyv5dwIiW0CZs/qQeXu3mT
         QKX2MFptTAoo5NsdNaEZNCHc/PUeui4acHIWKsPtCgELcZaQ/xjkcisJr0GRyLQ/Z53J
         ovUJuz6iOJ5hRaJT/FpQBEyvsnthxyAwas+1zQxdraprA/+Av0uQIF99QREurk9Q4ddz
         Zeuozq8Lj3XNHBNgAQ8v89MpflZawC+8ih269dTC1I47VBEFIc8jH5DkWduMWvDyqFqq
         HgfbFO+R0gQdep8QXLAbUUC8QjNP0I6BNPUlevrxXNy0CWwDE2uy3ea3EDvhrq1OfC/l
         OkXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:references:in-reply-to:message-id:date
         :subject:to:from:delivered-to;
        bh=1nHI/UyjGuLND43jpC7YHkij2kUmPae1Yx+KSoSqNS4=;
        b=JSX724FsCvWKHSa3/O7K5Isp8n6AiLzX2c390OKxuDGdl9/kRFvzW1vbGNp6jxBg+b
         JK1PVCuuFWqhnJ8/GFr+tHlCVRVwH170YQemQzmFJ8dUcR00JPMkFghWecxDwwug0ljN
         NXIkBrGwAIcZ444yEtxLZ6WQRJPzbWzvEPtxREYz9Rk8KGuo9BLP9cL312X+Gj3WZeGk
         HEsMOy50bJ/3DBFW7WNIJDdfxDmvJOWum6tAFITEms4Qt4BknHCGsVdkP9KpHO9koMpI
         kbQYC+SibqNlvljcGy16/os30VgdabRnCVoxYapqZv2ss21WLPPtr2cYyNhKnwU4eCzQ
         zCcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id cs12si1220580plb.127.2019.03.19.23.46.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2019 23:46:38 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5428911F;
	Wed, 20 Mar 2019 06:46:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5B28911F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Mar 2019 06:46:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Mar 2019 23:46:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,248,1549958400"; d="scan'208";a="135787400"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.25])
 by fmsmga007.fm.intel.com with ESMTP; 19 Mar 2019 23:46:35 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915/gvt: Enable synchronous flip on handling
 MI_DISPLAY_FLIP
Date: Wed, 20 Mar 2019 14:45:20 +0800
Message-Id: <20190320064521.31145-3-colin.xu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190320064521.31145-1-colin.xu@intel.com>
References: <20190320064521.31145-1-colin.xu@intel.com>
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
Cc: colin.xu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

QWNjb3JkaW5nIHRvIEludGVsIEdGWCBQUk0gb24gMDEub3JnLCB0aGUgTUlfRElTUExBWV9GTElQ
IGNvbW1hbmQgY2FuCmVpdGhlciByZXF1ZXN0IGRpc3BsYXkgcGxhbmUgZmxpcCBzeW5jaHJvbm91
c2x5IG9yIGFzeW5jaHJvbm91c2x5LgpJbiBzeW5jaHJvbm91cyBmbGlwLCBmbGlwIHdpbGwgYmUg
aG9sZCB1bnRpbCBuZXh0IHZzeW5jLCB3aGljaAppcyBub3QgaW1wbGVtZW50ZWQgeWV0IGluIEdW
VC4gSW4gYXN5bmNocm9ub3VzIGZsaXAsIGZsaXAgd2lsbCBoYXBwZW4KaW1tZWRpYXRlbHksIHdo
aWNoIGlzIGN1cnJlbnQgaW1wbGVtZW50YXRpb24uCgpUaGUgcGF0Y2ggZW5hYmxlcyB0aGUgc3lu
YyBmbGlwIG9uIGhhbmRsaW5nIE1JX0RJU1BMQVlfRkxJUCwKYW5kIGluY3JlbWVudCBmbGlwIGNv
dW50IGNvcnJlY3RseSBieSBvbmx5IGluY3JlbWVudCBvbiBwcmltYXJ5IHBsYW5lLgoKU2lnbmVk
LW9mZi1ieTogQ29saW4gWHUgPGNvbGluLnh1QGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvY21kX3BhcnNlci5jIHwgMTAgKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2Nt
ZF9wYXJzZXIuYwppbmRleCBkOGQ1OTY5NTYxOWUuLmZjYTM5ZjY3M2E5OCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvY21kX3BhcnNlci5jCkBAIC0xMzE3LDggKzEzMTcsMTQgQEAgc3RhdGljIGlu
dCBnZW44X3VwZGF0ZV9wbGFuZV9tbWlvX2Zyb21fbWlfZGlzcGxheV9mbGlwKAogCQkJICAgICAg
aW5mby0+dGlsZV92YWwgPDwgMTApOwogCX0KIAotCXZncHVfdnJlZ190KHZncHUsIFBJUEVfRlJN
Q09VTlRfRzRYKGluZm8tPnBpcGUpKSsrOwotCWludGVsX3ZncHVfdHJpZ2dlcl92aXJ0dWFsX2V2
ZW50KHZncHUsIGluZm8tPmV2ZW50KTsKKwlpZiAoaW5mby0+cGxhbmUgPT0gUExBTkVfUFJJTUFS
WSkKKwkJdmdwdV92cmVnX3QodmdwdSwgUElQRV9GTElQQ09VTlRfRzRYKGluZm8tPnBpcGUpKSsr
OworCisJaWYgKGluZm8tPmFzeW5jX2ZsaXApCisJCWludGVsX3ZncHVfdHJpZ2dlcl92aXJ0dWFs
X2V2ZW50KHZncHUsIGluZm8tPmV2ZW50KTsKKwllbHNlCisJCXNldF9iaXQoaW5mby0+ZXZlbnQs
IHZncHUtPmlycS5mbGlwX2RvbmVfZXZlbnRbaW5mby0+cGlwZV0pOworCiAJcmV0dXJuIDA7CiB9
CiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pbnRlbC1ndnQtZGV2
