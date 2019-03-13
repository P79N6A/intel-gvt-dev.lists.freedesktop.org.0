Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp3145070ywb;
        Tue, 12 Mar 2019 18:18:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwpEUMwyM3/Eh1eOcBvUs/lYb5bNn3L52jmFyW7ZKV4f4q373s4juG0r9LYWOvvHxjx/fNi
X-Received: by 2002:a65:6098:: with SMTP id t24mr29791212pgu.57.1552439908175;
        Tue, 12 Mar 2019 18:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552439908; cv=none;
        d=google.com; s=arc-20160816;
        b=crtxQXRvcpWsp1j6TGfSVdAYpm4Fq8g0rrrxPqrmRuZlPN4e1q/yneU5TzG8Fz+Uc0
         Wj6Rim8Oh21uVi+JZJGRzZ7/mSUfRSATHfiP+++1othYNYHyeCJtkOlYk8Wgw6sQZ5UG
         t+FGO84wphGWE1EN6e78usWAfgo0xmw5nWoaMqWKvmJPfGm+QpUACEAO6WQ2KfY5WOI+
         GhVRScTZs7KHpif5LZBhvv5RqoNrhaISKaaB6kNEoPgLYnV2UAlVt4JXEBbH1e4I/JNa
         5F3+boIn5C7cTC1qg/AiFFaYr+kecWgg0Z/0Jv1+JQjPBzQTn2WktQ9y/E7PgkIoqZwx
         skOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=0d3V2ik/2x86x6gVKKmvsLLv1mY82nCXXYZ1Tr3r2xM=;
        b=WnzJGvcaVyyDLq/BRVAULVH32Y0Qo5N3H18e1nkchshOo+XZhFxg02ZgfXSfZGubBG
         nJihYBfYa9mnyZ26twIgXfv4+EZ08XHLYbwUC1/dmmakWdL0oTg1jz2tt9ApeRyNGnqw
         ONl5/VogQOt/po6YEt4H7aboPsbGQVDpZ9sBh4I73jsfxvOuQn8SliI7hshUBTEVEbIl
         viASBtsVX0cqNKzS7uPryB884+jPGqtOmT4211g2terMUK4VUwXGGSuwsk4JymfT3uUU
         VOuRXz1ODZLtjHrRLya1ta6xUVH6mIDog5eZYc+pABdjIBa8WN7Mem52lyh9Uatf//dO
         9Y9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id y14si9256168pll.378.2019.03.12.18.18.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2019 18:18:28 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED8289E9B;
	Wed, 13 Mar 2019 01:18:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A891689E9B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 13 Mar 2019 01:18:25 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2019 18:18:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,472,1544515200"; d="scan'208";a="151787591"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by fmsmga004.fm.intel.com with ESMTP; 12 Mar 2019 18:18:21 -0700
Date: Tue, 12 Mar 2019 21:13:01 -0400
From: Zhao Yan <yan.y.zhao@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 0/5] QEMU VFIO live migration
Message-ID: <20190313011301.GA16072@joy-OptiPlex-7040>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <20190221134051.2c28893e@w520.home>
 <20190225022255.GP16456@joy-OptiPlex-7040>
 <20190307104421.534ea56f@w520.home>
 <20190312025747.GI21353@joy-OptiPlex-7040>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190312025747.GI21353@joy-OptiPlex-7040>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "Zhengxiao.zx@Alibaba-inc.com" <Zhengxiao.zx@Alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

aGkgQWxleApBbnkgY29tbWVudHMgdG8gdGhlIHNlcXVlbmNlIGJlbG93PwoKQWN0YXVsbHkgd2Ug
aGF2ZSBzb21lIGNvbmNlcm5zIGFuZCBzdWdnZXN0aW9ucyB0byB1c2Vyc3BhY2Utb3BhcXVlIG1p
Z3JhdGlvbgpkYXRhLgoKMS4gaWYgZGF0YSBpcyBvcGFxdWUgdG8gdXNlcnNwYWNlLCBrZXJuZWwg
aW50ZXJmYWNlIG11c3QgYmUgdGlnaHRseSBib3VuZCB0bwptaWdyYXRpb24uIAogICBlLmcuIHZl
bmRvciBkcml2ZXIgaGFzIHRvIGtub3cgc3RhdGUgKHJ1bm5pbmcgKyBub3QgbG9nZ2luZykgc2hv
dWxkIG5vdAogICByZXR1cm4gYW55IGRhdGEsIGFuZCBzdGF0ZSAocnVubmluZyArIGxvZ2dpbmcp
IHNob3VsZCByZXR1cm4gd2hvbGUKICAgc25hcHNob3QgZmlyc3QgYW5kIGRpcnR5IGxhdGVyLiBp
dCBhbHNvIGhhcyB0byBrbm93IHFlbXUgbWlncmF0aW9uIHdpbGwKICAgbm90IGNhbGwgR0VUX0JV
RkZFUiBpbiBzdGF0ZSAocnVubmluZyArIG5vdCBsb2dnaW5nKSwgb3RoZXJ3aXNlLCBpdCBoYXMK
ICAgdG8gYWRqdXN0IGl0cyBiZWhhdmlvci4KCjIuIHZlbmRvciBkcml2ZXIgY2Fubm90IGVuc3Vy
ZSB1c2Vyc3BhY2UgZ2V0IGFsbCB0aGUgZGF0YSBpdCBpbnRlbmRzIHRvCnNhdmUgaW4gcHJlLWNv
cHkgcGhhc2UuCiAgZS5nLiBpbiBzdG9wLWFuZC1jb3B5IHBoYXNlLCB2ZW5kb3IgZHJpdmVyIGhh
cyB0byBmaXJzdCBjaGVjayBhbmQgc2VuZAogIGRhdGEgaW4gcHJldmlvdXMgcGhhc2UuCiAKCjMu
IGlmIGFsbCB0aGUgc2VxdWVuY2UgaXMgdGlnaHRseSBib3VuZCB0byBsaXZlIG1pZ3JhdGlvbiwg
Y2FuIHdlIHJlbW92ZSB0aGUKbG9nZ2luZyBzdGF0ZT8gd2hhdCBhYm91dCBhZGRpbmcgdHdvIHN0
YXRlcyBtaWdyYXRlLWluIGFuZCBtaWdyYXRlLW91dD8Kc28gdGhlcmUgYXJlIGZvdXIgc3RhdGVz
OiBydW5uaW5nLCBzdG9wcGVkLCBtaWdyYXRlLWluLCBtaWdyYXRlLW91dC4KICAgbWlncmF0ZS1v
dXQgaXMgZm9yIHNvdXJjZSBzaWRlIHdoZW4gbWlncmF0aW9uIHN0YXJ0cy4gdG9nZXRoZXIgd2l0
aAogICBzdGF0ZSBydW5uaW5nIGFuZCBzdG9wcGVkLCBpdCBjYW4gc3Vic3RpdHV0ZSBzdGF0ZSBs
b2dnaW5nLgogICBtaWdyYXRlLWluIGlzIGZvciB0YXJnZXQgc2lkZS4KCgpUaGFua3MKWWFuCgpP
biBUdWUsIE1hciAxMiwgMjAxOSBhdCAxMDo1Nzo0N0FNICswODAwLCBaaGFvIFlhbiB3cm90ZToK
PiBoaSBBbGV4Cj4gdGhhbmtzIGZvciB5b3VyIHJlcGx5Lgo+IAo+IFNvLCBpZiB3ZSBjaG9vc2Ug
bWlncmF0aW9uIGRhdGEgdG8gYmUgdXNlcnNwYWNlIG9wYXF1ZSwgZG8geW91IHRoaW5rIGJlbG93
Cj4gc2VxdWVuY2UgaXMgdGhlIHJpZ2h0IGJlaGF2aW9yIGZvciB2ZW5kb3IgZHJpdmVyIHRvIGZv
bGxvdzoKPiAKPiAxLiBpbml0aWFsbHkgTE9HR0lORyBzdGF0ZSBpcyBub3Qgc2V0LiBJZiB1c2Vy
c3BhY2UgY2FsbHMgR0VUX0JVRkZFUiB0bwo+IHZlbmRvciBkcml2ZXIsICB2ZW5kb3IgZHJpdmVy
IHNob3VsZCByZWplY3QgYW5kIHJldHVybiAwLgo+IAo+IDIuIHRoZW4gTE9HR0lORyBzdGF0ZSBp
cyBzZXQsIGlmIHVzZXJzcGFjZSBjYWxscyBHRVRfQlVGRkVSIHRvIHZlbmRvcgo+IGRyaXZlciwK
PiAgICBhLiB2ZW5kb3IgZHJpdmVyIHNob3VkIGZpcnN0IHF1ZXJ5IGEgd2hvbGUgc25hcHNob3Qg
b2YgZGV2aWNlIG1lbW9yeQo+ICAgIChsZXQncyB1c2UgdGhpcyB0ZXJtIHRvIHJlcHJlc2VudCBk
ZXZpY2UncyBzdGFuZGFsb25lIG1lbW9yeSBmb3Igbm93KSwKPiAgICBiLiB2ZW5kb3IgZHJpdmVy
IHJldHVybnMgYSBjaHVuayBvZiBkYXRhIGp1c3QgcXVlcmllZCB0byB1c2Vyc3BhY2UsCj4gICAg
d2hpbGUgcmVjb3JkaW5nIGN1cnJlbnQgcG9zIGluIGRhdGEuCj4gICAgYy4gdmVuZG9yIGRyaXZl
ciBmaW5kcyBhbGwgZGF0YSBqdXN0IHF1ZXJpZWQgaXMgZmluaXNoZWQgdHJhbnNtaXR0aW5nIHRv
Cj4gICAgdXNlcnNwYWNlLCBhbmQgcXVlcmllcyBvbmx5IGRpcnR5IGRhdGEgaW4gZGV2aWNlIG1l
bW9yeSBub3cuCj4gICAgZC4gdmVuZG9yIGRyaXZlciByZXR1cm5zIGEgY2h1bmsgb2YgZGF0YSBq
dXN0IHF1ZXJlZCAodGhpcyB0aW1lIGlzIGRpcnR5Cj4gICAgZGF0YSApdG8gdXNlcnNwYWNlIHdo
aWxlIHJlY29yZGluZyBjdXJyZW50IHBvcyBpbiBkYXRhCj4gICAgZS4gaWYgYWxsIGRhdGEgaXMg
dHJhbnNtaXRlZCB0byB1c2VzcGFjZSBhbmQgc3RpbGwgR0VUX0JVRkZFUnMgY29tZSBmcm9tCj4g
ICAgdXNlcnNwYWNlLCB2ZW5kb3IgZHJpdmVyIHN0YXJ0cyBhbm90aGVyIHJvdW5kIG9mIGRpcnR5
IGRhdGEgcXVlcnkuCj4gCj4gMy4gaWYgTE9HR0lORyBzdGF0ZSBpcyB1bnNldCB0aGVuLCBhbmQg
dXNlcnBhY2UgY2FsbHMgR0VUX0JVRkZFUiB0byB2ZW5kb3IKPiBkcml2ZXIsCj4gICAgYS4gaWYg
dmVuZG9yIGRyaXZlciBmaW5kcyB0aGVyZSdzIHByZXZpb3VzbHkgdW50cmFuc21pdHRlZCBkYXRh
LCByZXR1cm5zCj4gICAgdGhlbSB1bnRpbCBhbGwgdHJhbnNtaXR0ZWQuCj4gICAgYi4gdmVuZG9y
IGRyaXZlciB0aGVuIHF1ZXJpZXMgZGlydHkgZGF0YSBhZ2FpbiBhbmQgdHJhbnNtaXRzIHRoZW0u
Cj4gICAgYy4gYXQgbGFzdCwgdmVuZG9yIGRyaXZlciBxdWVyaXMgZGV2aWNlIGNvbmZpZyBkYXRh
ICh3aGljaCBoYXMgdG8gYmUKPiAgICBxdWVyaWVkIGF0IGxhc3QgYW5kIHNlbnQgb25jZSkgYW5k
IHRyYW5zbWl0cyB0aGVtLgo+IAo+IAo+IGZvciB0aGUgMSBidWxsZXQsIGlmIExPR0dJTkcgc3Rh
dGUgaXMgZmlyc3RseSBzZXQgYW5kIG1pZ3JhdGlvbiBhYm9ydHMKPiB0aGVuLCAgdmVuZG9yIGRy
aXZlciBoYXMgdG8gYmUgYWJsZSB0byBkZXRlY3QgdGhhdCBjb25kaXRpb24uIHNvIHNlZW1pbmds
eSwKPiB2ZW5kb3IgZHJpdmVyIGhhcyB0byBrbm93IG1vcmUgcWVtdSdzIG1pZ3JhdGlvbiBzdGF0
ZSwgbGlrZSBtaWdyYXRpb24KPiBjYWxsZWQgYW5kIGZhaWxlZC4gRG8geW91IHRoaW5rIHRoYXQn
cyBhY2NlcHRhYmxlPwo+IAo+IAo+IFRoYW5rcwo+IFlhbgo+IAo+IApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlz
dAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
