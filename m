Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3027768ywo;
        Sun, 7 Apr 2019 22:57:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxXyBBFSF0B2lJwoZk88ui0qfzJmNlvgmcpefgok4zoH6c3ytffcg5v6B5xnhTFWqfjIMU5
X-Received: by 2002:a17:902:aa5:: with SMTP id 34mr28015424plp.302.1554703075914;
        Sun, 07 Apr 2019 22:57:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554703075; cv=none;
        d=google.com; s=arc-20160816;
        b=NQdwWj8dUH62xl+BQDhZNqU8bmHh57HtOMJmPjgAkItsUk6zNxgxr9k8PIcYwadML1
         EVDco3KAYhEwHeXd4+TtvmlNLrqGkDqMmdFX+xvFy0f98U+dUp/1OqbStnP3OWxKH9p5
         xJ7QwF6VnO4aYaIgt7h6dihSWooL9uK6hVm2bYW4PWsO4R7aCce6vNQ+m8UESwtiaPYa
         F/95f8MPS9WxMSJCztDA6o5AGJJm+LJpKy5l+ALkhxPjniypw8V0/vHR8/zn9/qg4Gbz
         OBulzPFSwKNqdyXclB7zz3g9yAiSGLXPhfEPgXJECJpV3h9KTRh0Fh5Za8QyXT8xFrId
         6/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=QHv3qjxsKyFN9XW6LZH9aTkka3mUmIF0htMK9/JmdsQ=;
        b=YKxV3S49GkGythK7rM0dWhjeKCxi+EyvyN/dvkcgxjXC43WyMv4ZiriNav6P7/YqzV
         +wY8HToJEY9iUwW3jvbH8+h6dJKkulpcw+hy2iUr7HZozZNw61N0XeuFJH9a7cz/gX77
         pPbLLVYEeSKLtq/XhbITfiI5L1lTNgi0aFj/x0H6Zm3JeQgsx3ioa162cVA7uWDO8LCb
         v7OibDPV51N8meyPQKRgDNiStabdAmGveQ9k1KoCsFm8nrYSZbzyyZcfCCwR4UyyQ56d
         1HigCNZoZkiU/z5D3RtuPC206fBut83NIp+tMM2GUQLj8Qx7VFtw/qb77bmynmkl2YuV
         /1wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id c20si25290970pfi.259.2019.04.07.22.57.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Apr 2019 22:57:55 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8AE89270;
	Mon,  8 Apr 2019 05:57:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71EC18926F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Apr 2019 05:57:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Apr 2019 22:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,324,1549958400"; d="scan'208";a="148923490"
Received: from aleksei-desktop.tm.intel.com ([10.237.55.101])
 by orsmga002.jf.intel.com with ESMTP; 07 Apr 2019 22:57:52 -0700
From: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 3/5] drm/i915/gvt: Use snprintf() to prevent possible buffer
 overflow.
Date: Mon,  8 Apr 2019 08:55:00 +0300
Message-Id: <20190408055502.8474-3-aleksei.gimbitskii@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190408055502.8474-1-aleksei.gimbitskii@intel.com>
References: <20190408055502.8474-1-aleksei.gimbitskii@intel.com>
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
Cc: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Rm9yIHByaW50aW5nIHRoZSBpbnRlbF92Z3B1LT5pZCwgYSBidWZmZXIgd2l0aCBmaXhlZCBsZW5n
dGggaXMgYWxsb2NhdGVkCm9uIHRoZSBzdGFjay4gQnV0IGlmIHZncHUtPmlkIGlzIGdyZWF0ZXIg
dGhhbiA2IGNoYXJhY3RlcnMsIHRoZSBidWZmZXIKb3ZlcmZsb3cgd2lsbCBoYXBwZW4uIEV2ZW4g
dGhlIHN0cmluZyBvZiB0aGUgYW1vdW50IG9mIG1heCB2Z3B1IGlzIGxlc3MKdGhhdCB0aGUgbGVu
Z3RoIGJ1ZmZlciByaWdodCBub3csIGl0J3MgYmV0dGVyIHRvIHJlcGxhY2Ugc3ByaW50ZigpIHdp
dGgKc25wcmludGYoKS4KClRoaXMgcGF0Y2ggZml4ZWQgdGhlIGNyaXRpY2FsIGlzc3VlICM2NzMg
cmVwb3J0ZWQgYnkga2xvY3dvcmsuCgpTaWduZWQtb2ZmLWJ5OiBBbGVrc2VpIEdpbWJpdHNraWkg
PGFsZWtzZWkuZ2ltYml0c2tpaUBpbnRlbC5jb20+CkNjOiBaaGVueXUgV2FuZyA8emhlbnl1d0Bs
aW51eC5pbnRlbC5jb20+CkNjOiBaaGkgV2FuZyA8emhpLmEud2FuZ0BpbnRlbC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RlYnVnZnMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGVidWdm
cy5jCmluZGV4IDJlYzg5YmNiNTlmMS4uNTFiMjcwNTAxOGQ1IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvZGVidWdmcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9kZWJ1Z2ZzLmMKQEAgLTE5OCw3ICsxOTgsNyBAQCBpbnQgaW50ZWxfZ3Z0X2RlYnVnZnNfYWRk
X3ZncHUoc3RydWN0IGludGVsX3ZncHUgKnZncHUpCiAJc3RydWN0IGRlbnRyeSAqZW50OwogCWNo
YXIgbmFtZVsxMF0gPSAiIjsKIAotCXNwcmludGYobmFtZSwgInZncHUlZCIsIHZncHUtPmlkKTsK
KwlzbnByaW50ZihuYW1lLCAxMCwgInZncHUlZCIsIHZncHUtPmlkKTsKIAl2Z3B1LT5kZWJ1Z2Zz
ID0gZGVidWdmc19jcmVhdGVfZGlyKG5hbWUsIHZncHUtPmd2dC0+ZGVidWdmc19yb290KTsKIAlp
ZiAoIXZncHUtPmRlYnVnZnMpCiAJCXJldHVybiAtRU5PTUVNOwotLSAKMi4xNy4xCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KSW50ZWwgRmlubGFuZCBPeQpSZWdpc3RlcmVkIEFkZHJlc3M6IFBMIDI4MSwgMDAxODEg
SGVsc2lua2kgCkJ1c2luZXNzIElkZW50aXR5IENvZGU6IDAzNTc2MDYgLSA0IApEb21pY2lsZWQg
aW4gSGVsc2lua2kgCgpUaGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIG1heSBjb250YWlu
IGNvbmZpZGVudGlhbCBtYXRlcmlhbCBmb3IKdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCBy
ZWNpcGllbnQocykuIEFueSByZXZpZXcgb3IgZGlzdHJpYnV0aW9uCmJ5IG90aGVycyBpcyBzdHJp
Y3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQKcmVjaXBpZW50LCBw
bGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIGFuZCBkZWxldGUgYWxsIGNvcGllcy4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFp
bGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
