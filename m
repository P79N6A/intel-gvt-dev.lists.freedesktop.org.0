Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp3076791ywa;
        Tue, 19 Feb 2019 00:52:58 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYk/dRGaVGl4OgidONlNMF0QPy2CteESd0/+aiRxcJ6KVK8J3Pb/Bm21XL6X4u8RgqQsXsl
X-Received: by 2002:a17:902:7588:: with SMTP id j8mr30160719pll.22.1550566378553;
        Tue, 19 Feb 2019 00:52:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550566378; cv=none;
        d=google.com; s=arc-20160816;
        b=kx8rXZa8nkekJwPAn9whk8hkCR0ZMzwlv+vuLgW1AQ0Ozi7MdIV4BbhmWt4qRDANRU
         WyrEl1UX0HLVjbSbnzzgfgF1UDyXcGjZb1wFQS3ESAU2e0QMD3uB7vnpWKb89UHplYF/
         iSDUpgZ7Ltc/uur0PhtVG8Idj4YEr+JesiE2N9PF1EgTS+Fw9reqabavznwOI1/Rjpa5
         HHl5CF6FhF4wuFVkYKOOEvBojINhgXGwb0e1M7UbGMo+J9t1kziykQwvRvgwyo6u1oTJ
         7BUc09yU+Tw2lWSxlH9Y45Q/GyCGqOHwOwB9W/HIOqkLE3o0ppN/fBMFRPRjceWPpDDY
         +2WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=5JgQkPWc6XrO12bR3WNkEcuM/tz7ha/NqILUeebBfbs=;
        b=sYzg1pV6pQ4kMQ+ktiFd0Qt6GQRKeZrphDZkOEnfCSmMc3sQyhkZh+7qyKrpBRCOMH
         xghRU/5S9QmROAZT4e6Y7THst5biqlyOVJOwtdemzE3LFK0Xv0ga+31C4GQbots7jg7X
         0iy8nCDzDwbbLDBSuX1GcESUuQaBgXwB1mCewGicvMsRI9Z0s8YeVi+fMZUK+n+xypkX
         PTpGnQVlYAVlxLCsBMdBaWj9gq9PS4WSS26tsyafCGoftTuVMKv+Bf7LEpyFMrTn2/d0
         +Tf9KY0KJJyqrYJRL5FdKfrhvNCulM5feSxKuHcOOTB4QGPAvL0GGi07XXIFDChL0ITo
         s/dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id a19si254697plm.128.2019.02.19.00.52.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Feb 2019 00:52:58 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7A18923C;
	Tue, 19 Feb 2019 08:52:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACED8923C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Feb 2019 08:52:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2019 00:52:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,387,1544515200"; d="scan'208";a="125511180"
Received: from joy-desktop.sh.intel.com ([10.239.13.17])
 by fmsmga008.fm.intel.com with ESMTP; 19 Feb 2019 00:52:52 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: alex.williamson@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 4/5] vfio/migration: turn on migration
Date: Tue, 19 Feb 2019 16:52:51 +0800
Message-Id: <1550566371-3743-1-git-send-email-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
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
Cc: cjia@nvidia.com, kvm@vger.kernel.org, aik@ozlabs.ru,
 Zhengxiao.zx@Alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 kwankhede@nvidia.com, eauger@redhat.com, yi.l.liu@intel.com,
 eskultet@redhat.com, ziye.yang@intel.com, mlevitsk@redhat.com,
 pasic@linux.ibm.com, arei.gonglei@huawei.com, felipe@nutanix.com,
 Ken.Xue@amd.com, kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>,
 dgilbert@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 changpeng.liu@intel.com, cohuck@redhat.com, zhi.a.wang@intel.com,
 jonathan.davies@nutanix.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

aW5pdCB2ZmlvIG1pZ3JhdGlvbiBpbiB2ZmlvX3JlYWxpemUoKSBhbmQgcmVnaXN0ZXIgbWlncmF0
b24gYmxvY2tlciBpZgpmYWlsdXJlIG1ldC4KZmluYWxpemUgYWxsIG1pZ3JhdGlvbiByZXNvdXJj
ZXMgd2hlbiB2ZmlvX2luc3RhbmNlX2ZpbmFsaXplKCkuCgpTaWduZWQtb2ZmLWJ5OiBZYW4gWmhh
byA8eWFuLnkuemhhb0BpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IFl1bGVpIFpoYW5nIDx5dWxl
aS56aGFuZ0BpbnRlbC5jb20+Ci0tLQogaHcvdmZpby9wY2kuYyB8IDkgKysrLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2h3L3ZmaW8vcGNpLmMgYi9ody92ZmlvL3BjaS5jCmluZGV4IGI4ZTAwNmIuLjhiZjYyNWUgMTAw
NjQ0Ci0tLSBhL2h3L3ZmaW8vcGNpLmMKKysrIGIvaHcvdmZpby9wY2kuYwpAQCAtMzA2OCw2ICsz
MDY4LDggQEAgc3RhdGljIHZvaWQgdmZpb19yZWFsaXplKFBDSURldmljZSAqcGRldiwgRXJyb3Ig
KiplcnJwKQogICAgICAgICBnb3RvIG91dF90ZWFyZG93bjsKICAgICB9CiAKKyAgICB2ZmlvX21p
Z3JhdGlvbl9pbml0KHZkZXYsIGVycnApOworCiAgICAgdmZpb19yZWdpc3Rlcl9lcnJfbm90aWZp
ZXIodmRldik7CiAgICAgdmZpb19yZWdpc3Rlcl9yZXFfbm90aWZpZXIodmRldik7CiAgICAgdmZp
b19zZXR1cF9yZXNldGZuX3F1aXJrKHZkZXYpOwpAQCAtMzA4OSw2ICszMDkxLDcgQEAgc3RhdGlj
IHZvaWQgdmZpb19pbnN0YW5jZV9maW5hbGl6ZShPYmplY3QgKm9iaikKIAogICAgIHZmaW9fZGlz
cGxheV9maW5hbGl6ZSh2ZGV2KTsKICAgICB2ZmlvX2JhcnNfZmluYWxpemUodmRldik7CisgICAg
dmZpb19taWdyYXRpb25fZmluYWxpemUodmRldik7CiAgICAgZ19mcmVlKHZkZXYtPmVtdWxhdGVk
X2NvbmZpZ19iaXRzKTsKICAgICBnX2ZyZWUodmRldi0+cm9tKTsKICAgICAvKgpAQCAtMzIyMSwx
MSArMzIyNCw2IEBAIHN0YXRpYyBQcm9wZXJ0eSB2ZmlvX3BjaV9kZXZfcHJvcGVydGllc1tdID0g
ewogICAgIERFRklORV9QUk9QX0VORF9PRl9MSVNUKCksCiB9OwogCi1zdGF0aWMgY29uc3QgVk1T
dGF0ZURlc2NyaXB0aW9uIHZmaW9fcGNpX3Ztc3RhdGUgPSB7Ci0gICAgLm5hbWUgPSAidmZpby1w
Y2kiLAotICAgIC51bm1pZ3JhdGFibGUgPSAxLAotfTsKLQogc3RhdGljIHZvaWQgdmZpb19wY2lf
ZGV2X2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKmtsYXNzLCB2b2lkICpkYXRhKQogewogICAgIERl
dmljZUNsYXNzICpkYyA9IERFVklDRV9DTEFTUyhrbGFzcyk7CkBAIC0zMjMzLDcgKzMyMzEsNiBA
QCBzdGF0aWMgdm9pZCB2ZmlvX3BjaV9kZXZfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqa2xhc3Ms
IHZvaWQgKmRhdGEpCiAKICAgICBkYy0+cmVzZXQgPSB2ZmlvX3BjaV9yZXNldDsKICAgICBkYy0+
cHJvcHMgPSB2ZmlvX3BjaV9kZXZfcHJvcGVydGllczsKLSAgICBkYy0+dm1zZCA9ICZ2ZmlvX3Bj
aV92bXN0YXRlOwogICAgIGRjLT5kZXNjID0gIlZGSU8tYmFzZWQgUENJIGRldmljZSBhc3NpZ25t
ZW50IjsKICAgICBzZXRfYml0KERFVklDRV9DQVRFR09SWV9NSVNDLCBkYy0+Y2F0ZWdvcmllcyk7
CiAgICAgcGRjLT5yZWFsaXplID0gdmZpb19yZWFsaXplOwotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGlu
ZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
