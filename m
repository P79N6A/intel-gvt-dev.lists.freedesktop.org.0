Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp183081ywo;
        Tue, 23 Apr 2019 22:48:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxzvKDNfm/oHbYPiVN4MnCEx1/VqXqjv2KwC4F/6EEuJigTJbgJgChUF26B3P6fBuQC2Y4n
X-Received: by 2002:a63:e20b:: with SMTP id q11mr29667863pgh.263.1556084925129;
        Tue, 23 Apr 2019 22:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556084925; cv=none;
        d=google.com; s=arc-20160816;
        b=XOk9kOVOrih9C8P8J667RAHvFjuk+Icr0yysj+hvmLKefdYZjsGDW+8j7JNmPqQqj8
         q0afTIc86Q/9mLVaqCE0DrGiYaVAB9inf3//3gwJpP9KByRmQO4EMZekl2ROVAE+6aNH
         JawOQN4HqnadzneQwdKo9qhrfKp6v4Z1s/nYT9lrgDwL9Ktie3SOicjKsXk8hhaKW5uB
         TOiCw+aVa6MjZftm1gA42Fg691MhAF++GMKa5lp5kpg2RRXmk2ulhg5+FdUNOSbp7DbX
         QoCYrDugRS/RWwkOKHmEyvjT9IqWzjKdPnhIwDLCxTEqUhqUBddtxNONj0vVbQMGqi4e
         1P1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=wpXGESomCYmsGoOVgwCP1NsCXU4Iz41sjxt/YA8chjs=;
        b=JFi1CnnC7BXuw6g9d3oyWdd6DWvkSRfv941M3llVJXGqHEML3C2g4XVIDB8vj7lTDN
         UVpnsUBVl9LWSLLUcvtp5MSiyNpgRgd2NVngHVlXaKJmdp4TxX9oYocHoB0PZJ+AGDEW
         MzNYxyzDhbis1EhbcPK6pl+tbjloGofdZkEevomIsNGA5wSQGiV8wpz24P+BzYed1IPc
         bzXaSRR1c2GkCWFNQXCtdNEDoEfjSiDMOs4CuI6xvKDN2ijnv+vTGWFoswLruABGFItJ
         iHvUMu4wA7hVnjzcJ/jtdjWaie81OqHvx+bo/tVtjs5jh3+c/bK9I7ZGkH1Rx+vpkhHO
         k1bg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id i37si16909871pgb.436.2019.04.23.22.48.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2019 22:48:45 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8ED8967B;
	Wed, 24 Apr 2019 05:48:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4428967B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 24 Apr 2019 05:48:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Apr 2019 22:48:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,388,1549958400"; d="scan'208";a="145361526"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by fmsmga007.fm.intel.com with ESMTP; 23 Apr 2019 22:48:42 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/4] drm/i915/gvt: use cmd to restore in-context mmios to hw
 for gen9 platform
Date: Wed, 24 Apr 2019 01:43:05 -0400
Message-Id: <20190424054305.8054-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, Weinan Li <weinan.z.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Zm9yIHJlc3RvcmUtaW5oaWJpdCBjb250ZXh0LCBoYXJkd2FyZSB3aWxsIG5vdCBsb2FkIGluLWNv
bnRleHQgbW1pb3MKKGVuZ2luZSBjb250ZXh0IHBhcnQpIHRvIGhhcmR3YXJlLCBidXQgaGFyZHdh
cmUgd2lsbCBzYXZlIHRoZSBtbWlvCnZhbHVlcyBpbiBoYXJkd2FyZSBiYWNrIHRvIGNvbnRleHQg
aW1hZ2UuIFNvLCBpbiBvcmRlciB0byBzYXZlIGNvcnJlY3QKdmFsdWVzIG9mIHZHUFUgYmFjayB0
byBjb250ZXh0IGltYWdlLCB2YWx1ZXMgb2YgdkdQVSBtbWlvcyBoYXZlIHRvIGJlCmxvYWRlZCBp
bnRvIGhhcmR3YXJlIGZpcnN0IGZvciByZXN0b3JlLWluaGliaXQgY29udGV4dC4KCkluIHRoaXMg
cGF0Y2gsIHRoZSBtZWNoYW5pc20gaXMgYWxzbyBhcHBsaWVkIHRvIHNrbCBwbGF0Zm9ybS4KClRo
ZSByZWFzb24gZXhjbHVkaW5nIGdlbjggcGxhdGZvcm1zIGlzIG9ubHkgYmVjYXVzZSBvZiBsYWNr
aW5nIG9mIHRlc3RpbmcKb24gdGhvc2UgcGxhdGZvcm1zLgoKQ2M6IFdlaW5hbiBMaSA8d2VpbmFu
LnoubGlAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRl
bC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jIHwgNCArLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jCmluZGV4IDg5OThmYTVhYjE5OC4uMWYzYmE4ZWZiOTk0
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jCkBAIC0yOTksOSArMjk5LDcgQEAg
c3RhdGljIGludCBjb3B5X3dvcmtsb2FkX3RvX3JpbmdfYnVmZmVyKHN0cnVjdCBpbnRlbF92Z3B1
X3dvcmtsb2FkICp3b3JrbG9hZCkKIAl2b2lkICpzaGFkb3dfcmluZ19idWZmZXJfdmE7CiAJdTMy
ICpjczsKIAotCWlmICgoSVNfS0FCWUxBS0UocmVxLT5pOTE1KSB8fCBJU19CUk9YVE9OKHJlcS0+
aTkxNSkKLQkJfHwgSVNfQ09GRkVFTEFLRShyZXEtPmk5MTUpKQotCQkmJiBpc19pbmhpYml0X2Nv
bnRleHQocmVxLT5od19jb250ZXh0KSkKKwlpZiAoSVNfR0VOKHJlcS0+aTkxNSwgOSkgJiYgaXNf
aW5oaWJpdF9jb250ZXh0KHJlcS0+aHdfY29udGV4dCkpCiAJCWludGVsX3ZncHVfcmVzdG9yZV9p
bmhpYml0X2NvbnRleHQodmdwdSwgcmVxKTsKIAogCS8qIGFsbG9jYXRlIHNoYWRvdyByaW5nIGJ1
ZmZlciAqLwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2ludGVsLWd2dC1kZXY=
