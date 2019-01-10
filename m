Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp1662084ywd;
        Thu, 10 Jan 2019 03:12:08 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5CNoa4yS5j4bZ+sOXYRUenMmx/b7Jz8D7KJKWOBxIi6tOrjEclAOy8Vg93Hl2IfgyDgyLV
X-Received: by 2002:a17:902:8d95:: with SMTP id v21mr9940863plo.162.1547118728797;
        Thu, 10 Jan 2019 03:12:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547118728; cv=none;
        d=google.com; s=arc-20160816;
        b=PV2OQkrGqLGfiZ6y+Ox6IF9TT16IUZqQcyQfVi0cxtv1Y6KfD+4tTgSetmiCUOYwrS
         t88uSkpRoOI1NCYD9Fws0dvKTj8ych3Ka74QK8ty7ukcNBubY9RkLVLhNpk3e4PRol55
         7bRrXeaCsn8zqEB7MocS64Z4QWCkKHMK/ZRvoSZ8qZ7KfZGW1uziDIhsnwZvGOmh57x5
         e3szqPigt6JT2wDOw4EP0wHhnN6xIL2XQI6HuRdjdxulIPbrFyxLodZTufpuo1YlCLsM
         Fs1G3XyenfZ+PJrgfy3Cv4Cap7mLhIewSXSmx5XbOaaoVbSVsv7GSDdyGaaamX4xRUgM
         yyPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=ICCB8EJKRin/PqVqDPuXvoAuulUbuZ3zYa0Y0+PAFis=;
        b=nFd7pJkROEK+peHVfL4zI5rrtY5zKhXEdsF2ewrN5skRPlCa93K0jalFqyJdAHOi2b
         4hMUZ2ASvaZf33KDRyZ+rY+t2ifqg46GayCsrYYLb0CXsn4GTFOfr25XiD1BOfF4Nnih
         lIFnTdZuSA9/SxLoSEIU0+yXJrwHNM9Yx6d7sfLI81/th79Ou/WB9tC9IYcZQ7vAL0Vs
         HEIkPeeSWTfpXEce39ZUp/dcvreK9imbxarekXJTNmZr0oN4iLUnoDUGL6fv6vFApHZt
         zvhaq8bO7Cj3/Nh4+ia3OtaSPRW/AnsBAWX6QB5Lx+gOz06BmhC1b7X/YrrTDQFQFTD4
         fvbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id g124si9277591pgc.568.2019.01.10.03.12.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Jan 2019 03:12:08 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629AA6F2A7;
	Thu, 10 Jan 2019 11:12:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB6E6F2A8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 10 Jan 2019 11:12:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2019 03:12:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,461,1539673200"; d="scan'208";a="290468332"
Received: from henry-optiplex-7050.bj.intel.com ([10.238.157.81])
 by orsmga005.jf.intel.com with ESMTP; 10 Jan 2019 03:12:04 -0800
From: hang.yuan@linux.intel.com
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v1 1/4] drm/i915/gvt: add one hypercall to clean vfio regions
Date: Thu, 10 Jan 2019 19:04:45 +0800
Message-Id: <1547118288-1001-2-git-send-email-hang.yuan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547118288-1001-1-git-send-email-hang.yuan@linux.intel.com>
References: <1547118288-1001-1-git-send-email-hang.yuan@linux.intel.com>
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
Cc: Hang Yuan <hang.yuan@linux.intel.com>, kraxel@redhat.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RnJvbTogSGFuZyBZdWFuIDxoYW5nLnl1YW5AbGludXguaW50ZWwuY29tPgoKQWRkIG9uZSBoeXBl
cmNhbGwgdG8gZnJlZSBWRklPIHJlZ2lvbiBtZW1vcnkuIEFsc28gY2FsbCBpdCBpbiB2Z3B1CmRl
c3Ryb3kuCgpTaWduZWQtb2ZmLWJ5OiBIYW5nIFl1YW4gPGhhbmcueXVhbkBsaW51eC5pbnRlbC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2h5cGVyY2FsbC5oIHwgIDEgKwogZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMgICAgIHwgMTUgKysrKysrKysrKysrKysrCiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbXB0LmggICAgICAgfCAxNCArKysrKysrKysrKysrKwog
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYyAgICAgIHwgIDEgKwogNCBmaWxlcyBjaGFu
Z2VkLCAzMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2h5cGVyY2FsbC5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2h5cGVyY2FsbC5oCmlu
ZGV4IDUwNzk4ODYuLjJhYjQxMzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9oeXBlcmNhbGwuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaHlwZXJjYWxsLmgK
QEAgLTY3LDYgKzY3LDcgQEAgc3RydWN0IGludGVsX2d2dF9tcHQgewogCWludCAoKnNldF90cmFw
X2FyZWEpKHVuc2lnbmVkIGxvbmcgaGFuZGxlLCB1NjQgc3RhcnQsIHU2NCBlbmQsCiAJCQkgICAg
IGJvb2wgbWFwKTsKIAlpbnQgKCpzZXRfb3ByZWdpb24pKHZvaWQgKnZncHUpOworCXZvaWQgKCpj
bGVhbl9yZWdpb25zKSh2b2lkICp2Z3B1KTsKIAlpbnQgKCpnZXRfdmZpb19kZXZpY2UpKHZvaWQg
KnZncHUpOwogCXZvaWQgKCpwdXRfdmZpb19kZXZpY2UpKHZvaWQgKnZncHUpOwogCWJvb2wgKCpp
c192YWxpZF9nZm4pKHVuc2lnbmVkIGxvbmcgaGFuZGxlLCB1bnNpZ25lZCBsb25nIGdmbik7CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9rdm1ndC5jCmluZGV4IGExOWU2ODQuLjhjMzBkYzMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9rdm1ndC5jCkBAIC00OTMsNiArNDkzLDIwIEBAIHN0YXRpYyBpbnQga3ZtZ3Rfc2V0
X29wcmVnaW9uKHZvaWQgKnBfdmdwdSkKIAlyZXR1cm4gcmV0OwogfQogCitzdGF0aWMgdm9pZCBr
dm1ndF9jbGVhbl9yZWdpb25zKHZvaWQgKnBfdmdwdSkKK3sKKwlpbnQgaTsKKwlzdHJ1Y3QgaW50
ZWxfdmdwdSAqdmdwdSA9IChzdHJ1Y3QgaW50ZWxfdmdwdSAqKXBfdmdwdTsKKworCWZvciAoaSA9
IDA7IGkgPCB2Z3B1LT52ZGV2Lm51bV9yZWdpb25zOyBpKyspCisJCWlmICh2Z3B1LT52ZGV2LnJl
Z2lvbltpXS5vcHMtPnJlbGVhc2UpCisJCQl2Z3B1LT52ZGV2LnJlZ2lvbltpXS5vcHMtPnJlbGVh
c2UodmdwdSwKKwkJCQkJJnZncHUtPnZkZXYucmVnaW9uW2ldKTsKKwl2Z3B1LT52ZGV2Lm51bV9y
ZWdpb25zID0gMDsKKwlrZnJlZSh2Z3B1LT52ZGV2LnJlZ2lvbik7CisJdmdwdS0+dmRldi5yZWdp
b24gPSBOVUxMOworfQorCiBzdGF0aWMgdm9pZCBrdm1ndF9wdXRfdmZpb19kZXZpY2Uodm9pZCAq
dmdwdSkKIHsKIAlpZiAoV0FSTl9PTighKChzdHJ1Y3QgaW50ZWxfdmdwdSAqKXZncHUpLT52ZGV2
LnZmaW9fZGV2aWNlKSkKQEAgLTE4NzQsNiArMTg4OCw3IEBAIHN0YXRpYyBzdHJ1Y3QgaW50ZWxf
Z3Z0X21wdCBrdm1ndF9tcHQgPSB7CiAJLmRtYV9tYXBfZ3Vlc3RfcGFnZSA9IGt2bWd0X2RtYV9t
YXBfZ3Vlc3RfcGFnZSwKIAkuZG1hX3VubWFwX2d1ZXN0X3BhZ2UgPSBrdm1ndF9kbWFfdW5tYXBf
Z3Vlc3RfcGFnZSwKIAkuc2V0X29wcmVnaW9uID0ga3ZtZ3Rfc2V0X29wcmVnaW9uLAorCS5jbGVh
bl9yZWdpb25zID0ga3ZtZ3RfY2xlYW5fcmVnaW9ucywKIAkuZ2V0X3ZmaW9fZGV2aWNlID0ga3Zt
Z3RfZ2V0X3ZmaW9fZGV2aWNlLAogCS5wdXRfdmZpb19kZXZpY2UgPSBrdm1ndF9wdXRfdmZpb19k
ZXZpY2UsCiAJLmlzX3ZhbGlkX2dmbiA9IGt2bWd0X2lzX3ZhbGlkX2dmbiwKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tcHQuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9tcHQuaAppbmRleCA5YjQyMjVkLi4xYTA3OTk0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvbXB0LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21wdC5oCkBA
IC0zMTQsNiArMzE0LDIwIEBAIHN0YXRpYyBpbmxpbmUgaW50IGludGVsX2d2dF9oeXBlcnZpc29y
X3NldF9vcHJlZ2lvbihzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSkKIH0KIAogLyoqCisgKiBpbnRl
bF9ndnRfaHlwZXJ2aXNvcl9jbGVhbl9yZWdpb25zIC0gQ2xlYW4gcmVnaW9ucyBmb3IgZ3Vlc3QK
KyAqIEB2Z3B1OiBhIHZHUFUKKyAqCisgKi8KK3N0YXRpYyBpbmxpbmUgdm9pZCBpbnRlbF9ndnRf
aHlwZXJ2aXNvcl9jbGVhbl9yZWdpb25zKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KQoreworCWlm
ICghaW50ZWxfZ3Z0X2hvc3QubXB0LT5jbGVhbl9yZWdpb25zKQorCQlyZXR1cm47CisKKwlpbnRl
bF9ndnRfaG9zdC5tcHQtPmNsZWFuX3JlZ2lvbnModmdwdSk7Cit9CisKKworLyoqCiAgKiBpbnRl
bF9ndnRfaHlwZXJ2aXNvcl9nZXRfdmZpb19kZXZpY2UgLSBpbmNyZWFzZSB2ZmlvIGRldmljZSBy
ZWYgY291bnQKICAqIEB2Z3B1OiBhIHZHUFUKICAqCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvdmdwdS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYwppbmRl
eCBlMWM4NjBmOC4uYzVlYjU2NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L3ZncHUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5jCkBAIC0yNzYsNiAr
Mjc2LDcgQEAgdm9pZCBpbnRlbF9ndnRfZGVzdHJveV92Z3B1KHN0cnVjdCBpbnRlbF92Z3B1ICp2
Z3B1KQogCiAJV0FSTih2Z3B1LT5hY3RpdmUsICJ2R1BVIGlzIHN0aWxsIGFjdGl2ZSFcbiIpOwog
CisJaW50ZWxfZ3Z0X2h5cGVydmlzb3JfY2xlYW5fcmVnaW9ucyh2Z3B1KTsKIAlpbnRlbF9ndnRf
ZGVidWdmc19yZW1vdmVfdmdwdSh2Z3B1KTsKIAlpbnRlbF92Z3B1X2NsZWFuX3NjaGVkX3BvbGlj
eSh2Z3B1KTsKIAlpbnRlbF92Z3B1X2NsZWFuX3N1Ym1pc3Npb24odmdwdSk7Ci0tIAoyLjcuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==
