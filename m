Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp3367003ywb;
        Mon, 25 Mar 2019 01:26:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz7uVytUafGtrqHnqgjx5QtqTLHGhzcxIJUG/JozD9SAU76bBaobSO+VWJSMAVPsk6/a6Oj
X-Received: by 2002:a63:7d03:: with SMTP id y3mr10011758pgc.8.1553502361914;
        Mon, 25 Mar 2019 01:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553502361; cv=none;
        d=google.com; s=arc-20160816;
        b=jCHrp6dyoJyIuBEyysOMa0EmT/qOUYdEWSHJhyigQkfIkpA1hS3mafuWUcjXJFrfR6
         azYL/vIAUPrZZyKcU98/x7XAfUmKRzpWK6JQnChxugNS1ZO9vRWq3iMHoHlCZ2gd/RHH
         IqhWVtpQkw6+Ws2RJNeYwygUD8Nb6E5Ie92Qt2ORrzVjBQ3yyCZzacC415fVIcTm4z84
         FPAHJ38ibZW069MebfqKQdeYpPKa85Dj/MMEw64QNEAQJ4VaSFXTwdEAGzdhI7zh1tHu
         hbM4t81C3iMwr7XLTu76a/RVRcnJ7/lw88E7TU+o7hxOUYKa5/CFgJCXwqnqY5nk+Pcf
         Cv/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=huBCy9JdS8O9R0iCNDcU83bhUTDviq4YojXtKdk0Dhk=;
        b=feWCHsKks5G+AyCX5UyKrkKX6YKL+IKzAYRNvJFfPN2eHFG95g5kJl2m/PeZv6iGKV
         JOaLop004WOa3eiyfCF44wcsx3BE76NKr4wuDxJrgR0Ly6C0UNUJiFanhVwArUa9fYpf
         c8y6PCmtnQAmgkdC6DhZ1H5SmG9bKIQJhEngEE3OVqMChTUc0Hj7mNTUGHuI+aO/Le9E
         tl6hABdQIA9ipYel9svuEuEN7WbLz2OSWnIcf3ZMws2LExTHX4RgKxHPRbreBcRWBqB3
         22ZiQioenNMnmePUpWNQbKCwgDAdPc16D+lINXEj7US9Zxkyw/j+60Jqc6UtyXLuJihF
         O1pw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id q185si13323042pga.135.2019.03.25.01.26.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2019 01:26:01 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8366B6E67F;
	Mon, 25 Mar 2019 08:26:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A056E67F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 25 Mar 2019 08:26:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Mar 2019 01:26:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,256,1549958400"; d="scan'208";a="144974318"
Received: from test-optiplex-7040.bj.intel.com ([10.238.154.166])
 by orsmga002.jf.intel.com with ESMTP; 25 Mar 2019 01:25:59 -0700
From: Xiong Zhang <xiong.y.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/i915/gvt: Change fb_info->size from pages to bytes
Date: Mon, 25 Mar 2019 16:29:20 +0800
Message-Id: <1553502560-3796-2-git-send-email-xiong.y.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553502560-3796-1-git-send-email-xiong.y.zhang@intel.com>
References: <20190321075254.GG10798@zhen-hp.sh.intel.com>
 <1553502560-3796-1-git-send-email-xiong.y.zhang@intel.com>
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
Cc: Xiong Zhang <xiong.y.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

ZmJfaW5mby0+c2l6ZSBpcyBpbiBwYWdlcywgYnV0IHNvbWUgZnVuY3Rpb24gbmVlZCBieXRlcyB3
aGVuIGl0CmlzIGEgcGFyYW1ldGVyLiBTdWNoIGFzOgphLiBpbnRlbF9ndnRfZ2d0dF92YWxpZGF0
ZV9yYW5nZSgpIGFjY29yZGluZyB0byBmdW5jdGlvbiBkZWZpbml0aW9uCmIuIHZmaW9fZGV2aWNl
X2dmeF9wbGFuZV9pbmZvLT5zaXplIGFjY29yZGluZyB0byB0aGUgY29tbWVudCBvZgogICBpdHMg
ZGVmaW5pdGlvbgoKVGhpcyBwYXRjaCBjaGFuZ2UgZmJfaW5mby0+c2l6ZSBpbnRvIGJ5dGVzLgoK
djI6IEtlZXAgZmJfaW5mby0+c2l6ZSBpbiByZWFsIHNpemUgaW5zdGVhZCBvZiBhc3NpZ25pbmcg
Y2FzdGVkCiAgICBwYWdlIHNpemUoemhlbnl1KQoKU2lnbmVkLW9mZi1ieTogWGlvbmcgWmhhbmcg
PHhpb25nLnkuemhhbmdAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9k
bWFidWYuYyB8IDE3ICsrKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvZG1hYnVmLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZG1hYnVmLmMKaW5kZXgg
NWQ4ODdmNy4uNDg1NWIxYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2Rt
YWJ1Zi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYwpAQCAtNDUsNiAr
NDUsNyBAQCBzdGF0aWMgaW50IHZncHVfZ2VtX2dldF9wYWdlcygKIAlpbnQgaSwgcmV0OwogCWdl
bjhfcHRlX3QgX19pb21lbSAqZ3R0X2VudHJpZXM7CiAJc3RydWN0IGludGVsX3ZncHVfZmJfaW5m
byAqZmJfaW5mbzsKKwl1MzIgcGFnZV9udW07CiAKIAlmYl9pbmZvID0gKHN0cnVjdCBpbnRlbF92
Z3B1X2ZiX2luZm8gKilvYmotPmd2dF9pbmZvOwogCWlmIChXQVJOX09OKCFmYl9pbmZvKSkKQEAg
LTU0LDE0ICs1NSwxNSBAQCBzdGF0aWMgaW50IHZncHVfZ2VtX2dldF9wYWdlcygKIAlpZiAodW5s
aWtlbHkoIXN0KSkKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQlyZXQgPSBzZ19hbGxvY190YWJsZShz
dCwgZmJfaW5mby0+c2l6ZSwgR0ZQX0tFUk5FTCk7CisJcGFnZV9udW0gPSAoZmJfaW5mby0+c2l6
ZSArIFBBR0VfU0laRSAtIDEpID4+IFBBR0VfU0hJRlQ7CisJcmV0ID0gc2dfYWxsb2NfdGFibGUo
c3QsIHBhZ2VfbnVtLCBHRlBfS0VSTkVMKTsKIAlpZiAocmV0KSB7CiAJCWtmcmVlKHN0KTsKIAkJ
cmV0dXJuIHJldDsKIAl9CiAJZ3R0X2VudHJpZXMgPSAoZ2VuOF9wdGVfdCBfX2lvbWVtICopZGV2
X3ByaXYtPmdndHQuZ3NtICsKIAkJKGZiX2luZm8tPnN0YXJ0ID4+IFBBR0VfU0hJRlQpOwotCWZv
cl9lYWNoX3NnKHN0LT5zZ2wsIHNnLCBmYl9pbmZvLT5zaXplLCBpKSB7CisJZm9yX2VhY2hfc2co
c3QtPnNnbCwgc2csIHBhZ2VfbnVtLCBpKSB7CiAJCXNnLT5vZmZzZXQgPSAwOwogCQlzZy0+bGVu
Z3RoID0gUEFHRV9TSVpFOwogCQlzZ19kbWFfYWRkcmVzcyhzZykgPQpAQCAtMTU3LDggKzE1OSw3
IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqdmdwdV9jcmVhdGVfZ2VtKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJaWYgKG9iaiA9PSBOVUxMKQogCQlyZXR1cm4gTlVMTDsK
IAotCWRybV9nZW1fcHJpdmF0ZV9vYmplY3RfaW5pdChkZXYsICZvYmotPmJhc2UsCi0JCWluZm8t
PnNpemUgPDwgUEFHRV9TSElGVCk7CisJZHJtX2dlbV9wcml2YXRlX29iamVjdF9pbml0KGRldiwg
Jm9iai0+YmFzZSwgaW5mby0+c2l6ZSk7CiAJaTkxNV9nZW1fb2JqZWN0X2luaXQob2JqLCAmaW50
ZWxfdmdwdV9nZW1fb3BzKTsKIAogCW9iai0+cmVhZF9kb21haW5zID0gSTkxNV9HRU1fRE9NQUlO
X0dUVDsKQEAgLTIxMCw2ICsyMTEsNyBAQCBzdGF0aWMgaW50IHZncHVfZ2V0X3BsYW5lX2luZm8o
c3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAlzdHJ1Y3QgaW50ZWxfdmdwdV9wcmltYXJ5X3BsYW5l
X2Zvcm1hdCBwOwogCXN0cnVjdCBpbnRlbF92Z3B1X2N1cnNvcl9wbGFuZV9mb3JtYXQgYzsKIAlp
bnQgcmV0OworCXUzMiBwYWdlX251bTsKIAogCWlmIChwbGFuZV9pZCA9PSBEUk1fUExBTkVfVFlQ
RV9QUklNQVJZKSB7CiAJCXJldCA9IGludGVsX3ZncHVfZGVjb2RlX3ByaW1hcnlfcGxhbmUodmdw
dSwgJnApOwpAQCAtMjY0LDggKzI2Niw5IEBAIHN0YXRpYyBpbnQgdmdwdV9nZXRfcGxhbmVfaW5m
byhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAKLQlpbmZv
LT5zaXplID0gKGluZm8tPnN0cmlkZSAqIGluZm8tPmhlaWdodCArIFBBR0VfU0laRSAtIDEpCi0J
CSAgICAgID4+IFBBR0VfU0hJRlQ7CisJLy8gYWxpZ24gdG8gcGFnZQorCWluZm8tPnNpemUgPSBp
bmZvLT5zdHJpZGUgKiBpbmZvLT5oZWlnaHQ7CisJcGFnZV9udW0gPSAoaW5mby0+c2l6ZSArIFBB
R0VfU0laRSAtIDEpID4+IFBBR0VfU0hJRlQ7CiAJaWYgKGluZm8tPnNpemUgPT0gMCkgewogCQln
dnRfdmdwdV9lcnIoImZiIHNpemUgaXMgemVyb1xuIik7CiAJCXJldHVybiAtRUlOVkFMOwpAQCAt
Mjc1LDcgKzI3OCw3IEBAIHN0YXRpYyBpbnQgdmdwdV9nZXRfcGxhbmVfaW5mbyhzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LAogCQlndnRfdmdwdV9lcnIoIk5vdCBhbGlnbmVkIGZiIGFkZHJlc3M6MHgl
bGx4XG4iLCBpbmZvLT5zdGFydCk7CiAJCXJldHVybiAtRUZBVUxUOwogCX0KLQlpZiAoKChpbmZv
LT5zdGFydCA+PiBQQUdFX1NISUZUKSArIGluZm8tPnNpemUpID4KKwlpZiAoKChpbmZvLT5zdGFy
dCA+PiBQQUdFX1NISUZUKSArIHBhZ2VfbnVtKSA+CiAJCWdndHRfdG90YWxfZW50cmllcygmZGV2
X3ByaXYtPmdndHQpKSB7CiAJCWd2dF92Z3B1X2VycigiSW52YWxpZCBHVFQgb2Zmc2V0IG9yIHNp
emVcbiIpOwogCQlyZXR1cm4gLUVGQVVMVDsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdApp
bnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
