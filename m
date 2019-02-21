Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp5119884ywa;
        Wed, 20 Feb 2019 19:38:55 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaVjXpHWTclH04qsN8XXErIqcXEOEuGlFouTlbDipmavLf/eD+yvq1plZNRBVpKTLNO36yK
X-Received: by 2002:a65:620a:: with SMTP id d10mr31545027pgv.75.1550720335461;
        Wed, 20 Feb 2019 19:38:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550720335; cv=none;
        d=google.com; s=arc-20160816;
        b=hE6CIFTi4AwmycA6ZxUB+LDXBGNLJbZYTf+fjwyKcUX/m23SC/EDuKKTqKs2oQofOz
         EZMD2xc1d1Ojzw8dIugh27hPY87h69lbyJOYNcQApnybdicwvezUFlX0kicXJuiZMQpl
         9uyh15P8c99sctHAkF0iYNH5jr9IAMAqHec/M4KPGHI0o1tg3aXnjvhAvkTCINFQoni3
         pCljl2B6JFN6jOVB1dcnxvgRKomvFqoiaK/+3rYH25Pxy4ouIfOWpaHetkXPHAjRPP0b
         ciURhuKi/ZNNigiQTCUquktHEtFrb0E0rGzHhRtmqCa2o9mL4nvzebimZLHQ4pARd4b6
         qZfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=6XhXGq72rg0Y9pLBnzmg2nuliPOm8Y/7b9k7FpNUO9I=;
        b=vtdjCm32M2BGIJ5Hz6gOv8NmyZ8nVs4C+yKCF1Z0UsIe6PpJHMRVCKztwn2cZi68J+
         jtJFsbGsN2kr+HlR+2O5VD2Pdz1nmZINgyI5CWCdJRpgF/1vE9MJGtoPhf+TfRBfilhL
         09VYTIUwOInGaGLo9R0BSimCIJD+lkNrD/tphLUbN+yKUNGHtUxoUrwWtyfx7ff9/loE
         TRqnHyafNgjSSkRtVv1j286pi6VgvBG6hSLXcsEuLgOlF5jF7D90t78mJuzgmBQvdtDP
         zumIaXyRjNrfmbC6vi2SX0JwLgXHsMwdxxQmLbFysNUKg85AQ/GNifh1GJxDB8LbpvK4
         AP5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id s17si19504057pgi.513.2019.02.20.19.38.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Feb 2019 19:38:55 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087BE892AD;
	Thu, 21 Feb 2019 03:38:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CBD892AD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Feb 2019 03:38:52 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2019 19:38:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,393,1544515200"; d="scan'208";a="145244810"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by fmsmga002.fm.intel.com with ESMTP; 20 Feb 2019 19:38:50 -0800
Date: Wed, 20 Feb 2019 22:33:36 -0500
From: Zhao Yan <yan.y.zhao@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915/gvt: Fix MI_FLUSH_DW parsing with correct
 index check
Message-ID: <20190221033336.GM16456@joy-OptiPlex-7040>
References: <20190218064653.26020-1-zhenyuw@linux.intel.com>
 <20190220082504.15132-1-zhenyuw@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190220082504.15132-1-zhenyuw@linux.intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

TG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRl
bC5jb20+CgpPbiBXZWQsIEZlYiAyMCwgMjAxOSBhdCAwNDoyNTowNFBNICswODAwLCBaaGVueXUg
V2FuZyB3cm90ZToKPiBXaGVuIE1JX0ZMVVNIX0RXIHBvc3Qgd3JpdGUgaHcgc3RhdHVzIHBhZ2Ug
aW4gaW5kZXggbW9kZSwgdGhlIGluZGV4Cj4gdmFsdWUgaXMgaW4gZHdvcmQgc3RlcCBhbmQgdHVy
bmVkIGludG8gYWRkcmVzcyBvZmZzZXQgaW4gY21kIGR3b3JkMS4KPiBBcyBzdGF0dXMgcGFnZSBz
aXplIGlzIDRLLCBzbyBjYW4ndCBleGNlZWQgdGhhdC4KPiAKPiBUaGlzIGZpeGVkIHVwcGVyIGJv
dW5kIGNoZWNrIGluIGNtZCBwYXJzZXIgY29kZSB3aGljaCBpbmNvcnJlY3RseQo+IHN0b3BwZWQg
Vk0gZm9yIHJlYXNvbiBvZiBpbnZhbGlkIE1JX0ZMVVNIX0RXIHdyaXRlIGluZGV4Lgo+IAo+IHYy
Ogo+IC0gRml4IHVwcGVyIGJvdW5kIGFzIDRLIHBhZ2Ugc2l6ZSBiZWNhdXNlIGluZGV4IHZhbHVl
IGlzIGFkZHJlc3Mgb2Zmc2V0Lgo+IAo+IEZpeGVzOiBiZTFkYTcwNzBhZWEgKCJkcm0vaTkxNS9n
dnQ6IHZHUFUgY29tbWFuZCBzY2FubmVyIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAj
IHY0LjEwKwo+IENjOiAiWmhhbywgWWFuIFkiIDx5YW4ueS56aGFvQGludGVsLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMgfCAyICstCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2NtZF9wYXJzZXIuYwo+IGluZGV4IDM1YjRlYzNmNzYxOC4uMzU5MmQwNGMzM2IyIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jCj4gQEAgLTE0NDEsNyArMTQ0
MSw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IGNtZF9hZGRyZXNzX2F1ZGl0KHN0cnVjdCBwYXJzZXJf
ZXhlY19zdGF0ZSAqcywKPiAgCX0KPiAgCj4gIAlpZiAoaW5kZXhfbW9kZSkJewo+IC0JCWlmIChn
dWVzdF9nbWEgPj0gSTkxNV9HVFRfUEFHRV9TSVpFIC8gc2l6ZW9mKHU2NCkpIHsKPiArCQlpZiAo
Z3Vlc3RfZ21hID49IEk5MTVfR1RUX1BBR0VfU0laRSkgewo+ICAJCQlyZXQgPSAtRUZBVUxUOwo+
ICAJCQlnb3RvIGVycjsKPiAgCQl9Cj4gLS0gCj4gMi4yMC4xCj4gCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0
CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
