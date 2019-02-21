Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp5149107ywa;
        Wed, 20 Feb 2019 20:26:33 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYxsR0xZx+QTckI7oeXErUZruqfVo/bHSI8zdFCEiYZqU37idid6NlLV5WNSdxng29/QF3t
X-Received: by 2002:a62:1212:: with SMTP id a18mr38240883pfj.177.1550723193478;
        Wed, 20 Feb 2019 20:26:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550723193; cv=none;
        d=google.com; s=arc-20160816;
        b=FK+zs2Cx89mYPsSPE5XNQ5ULkUykXgVcSMX9a6ARiw9v+U97OrUaKvNX3Q/wF+oO9E
         xs32enaLhoQyfjpNOKwdgoZt7Go41+CxSvDNPyA4tZMGQE20SoECYttTbRaudNCStHEr
         ZvxuNfwQDuoGbyLcw3cYbFXPN0c3zJtHKFfofsHyPNcfZ9hxIrFQbA10SxKUF+hDZjFn
         7AYbDlRKZHUZjdXGO9KfqM/gMotlfdpD/vPYW8KuiYjZX6teBTfzDKjdzm9BRLqzlkHg
         dcPS1om9eZ3HilBit0WGwP7hdQRoaF4DLpGvFWYc/JvqaW1DqbIifcG87/1K0wGrzJMC
         MEBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=LhYaxPyDQr/suI+gCT0OuAZq2RjrSFQGZ4j0DJdfzIY=;
        b=tihR7wjqavPz8KQOIgbjEDT6DWYW7Oh6jrL32kjumk1R8sMlSoyG/nqMb0lNxRhqLx
         MQ3ySFZtN+sA+G4zdg1svIGMnc2m0R7Ak3/6Paj3tQ4hbO3qDHwz2ebvaLIif5VhvYGl
         KjqwRosDi9TSYBP6w5z8F2RuEDkkHf8/oedEPuaZxU0kgdEgLmvgpXVxXZ8cuCQ5hT+u
         oWX3soK5DW2VCNZydNofqCDo70gfpC5Ct2W1Eqgs3du8ZCwmOeefXmZDjZbOBLW3Tvtk
         58VEMc6CVK4BuZJvlkNid62FeFnYri4SnDFFDUi7//IWjcx1h3ipp+/0pEnt4I+1cQXV
         IyEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id p31si20636200pgb.440.2019.02.20.20.26.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Feb 2019 20:26:33 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B2188E3F;
	Thu, 21 Feb 2019 04:26:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C618988E3F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Feb 2019 04:26:30 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2019 20:26:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,393,1544515200"; d="scan'208";a="140343980"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by orsmga001.jf.intel.com with ESMTP; 20 Feb 2019 20:26:25 -0800
Date: Wed, 20 Feb 2019 23:21:11 -0500
From: Zhao Yan <yan.y.zhao@intel.com>
To: "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: Re: [PATCH 0/5] QEMU VFIO live migration
Message-ID: <20190221042111.GO16456@joy-OptiPlex-7040>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <33183CC9F5247A488A2544077AF19020DB25D374@dggeml511-mbx.china.huawei.com>
 <20190221002444.GH16456@joy-OptiPlex-7040>
 <33183CC9F5247A488A2544077AF19020DB25E1F3@dggeml511-mbx.china.huawei.com>
 <20190221020457.GL16456@joy-OptiPlex-7040>
 <33183CC9F5247A488A2544077AF19020DB25E7CD@dggeml511-mbx.china.huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33183CC9F5247A488A2544077AF19020DB25E7CD@dggeml511-mbx.china.huawei.com>
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
 "eauger@redhat.com" <eauger@redhat.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>,
 "ziye.yang@intel.com" <ziye.yang@intel.com>,
 "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "changpeng.liu@intel.com" <changpeng.liu@intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCBGZWIgMjEsIDIwMTkgYXQgMDM6MTY6NDVBTSArMDAwMCwgR29uZ2xlaSAoQXJlaSkg
d3JvdGU6Cj4gCj4gCj4gCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gRnJvbTog
WmhhbyBZYW4gW21haWx0bzp5YW4ueS56aGFvQGludGVsLmNvbV0KPiA+IFNlbnQ6IFRodXJzZGF5
LCBGZWJydWFyeSAyMSwgMjAxOSAxMDowNSBBTQo+ID4gVG86IEdvbmdsZWkgKEFyZWkpIDxhcmVp
LmdvbmdsZWlAaHVhd2VpLmNvbT4KPiA+IENjOiBhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbTsg
cWVtdS1kZXZlbEBub25nbnUub3JnOwo+ID4gaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7IFpoZW5neGlhby56eEBBbGliYWJhLWluYy5jb207Cj4gPiB5aS5sLmxpdUBpbnRlbC5j
b207IGVza3VsdGV0QHJlZGhhdC5jb207IHppeWUueWFuZ0BpbnRlbC5jb207Cj4gPiBjb2h1Y2tA
cmVkaGF0LmNvbTsgc2h1YW5ndGFpLnRzdEBhbGliYWJhLWluYy5jb207IGRnaWxiZXJ0QHJlZGhh
dC5jb207Cj4gPiB6aGkuYS53YW5nQGludGVsLmNvbTsgbWxldml0c2tAcmVkaGF0LmNvbTsgcGFz
aWNAbGludXguaWJtLmNvbTsKPiA+IGFpa0BvemxhYnMucnU7IGVhdWdlckByZWRoYXQuY29tOyBm
ZWxpcGVAbnV0YW5peC5jb207Cj4gPiBqb25hdGhhbi5kYXZpZXNAbnV0YW5peC5jb207IGNoYW5n
cGVuZy5saXVAaW50ZWwuY29tOyBLZW4uWHVlQGFtZC5jb207Cj4gPiBrd2Fua2hlZGVAbnZpZGlh
LmNvbTsga2V2aW4udGlhbkBpbnRlbC5jb207IGNqaWFAbnZpZGlhLmNvbTsKPiA+IGt2bUB2Z2Vy
Lmtlcm5lbC5vcmcKPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMC81XSBRRU1VIFZGSU8gbGl2ZSBt
aWdyYXRpb24KPiA+IAo+ID4gPiA+Cj4gPiA+ID4gPiA1KSBBYm91dCBsb2cgc3luYywgd2h5IG5v
dCByZWdpc3RlciBsb2dfZ2xvYmFsX3N0YXJ0L3N0b3AgaW4KPiA+ID4gPiB2ZmlvX21lbW9yeV9s
aXN0ZW5lcj8KPiA+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+IHNlZW1zIGxvZ19nbG9iYWxfc3Rh
cnQvc3RvcCBjYW5ub3QgYmUgaXRlcmF0ZWx5IGNhbGxlZCBpbiBwcmUtY29weSBwaGFzZT8KPiA+
ID4gPiBmb3IgZGlydHkgcGFnZXMgaW4gc3lzdGVtIG1lbW9yeSwgaXQncyBiZXR0ZXIgdG8gdHJh
bnNmZXIgZGlydHkgZGF0YQo+ID4gPiA+IGl0ZXJhdGl2ZWx5IHRvIHJlZHVjZSBkb3duIHRpbWUs
IHJpZ2h0Pwo+ID4gPiA+Cj4gPiA+Cj4gPiA+IFdlIGp1c3QgbmVlZCBpbnZva2luZyBvbmx5IG9u
Y2UgZm9yIHN0YXJ0IGFuZCBzdG9wIGxvZ2dpbmcuIFdoeSB3ZSBuZWVkIHRvCj4gPiBjYWxsCj4g
PiA+IHRoZW0gbGl0ZXJhdGVseT8gU2VlIG1lbW9yeV9saXN0ZW5lciBvZiB2aG9zdC4KPiA+ID4K
PiA+IHRoZSBkaXJ0eSBwYWdlcyBpbiBzeXN0ZW0gbWVtb3J5IHByb2R1Y2VzIGJ5IGRldmljZSBp
cyBpbmNyZW1lbnRhbC4KPiA+IGlmIGl0IGNhbiBiZSBnb3QgaXRlcmF0aXZlbHksIHRoZSBkaXJ0
eSBwYWdlcyBpbiBzdG9wLWFuZC1jb3B5IHBoYXNlIGNhbiBiZQo+ID4gbWluaW1hbC4KPiA+IDop
Cj4gPiAKPiBJIG1lYW4gc3RhcnRpbmcgb3Igc3RvcHBpbmcgdGhlIGNhcGFiaWxpdHkgb2YgbG9n
Z2luZywgbm90IGxvZyBzeW5jLiAKPiAKPiBXZSByZWdpc3RlciB0aGUgYmVsb3cgY2FsbGJhY2tz
Ogo+IAo+IC5sb2dfc3luYyA9IHZmaW9fbG9nX3N5bmMsCj4gLmxvZ19nbG9iYWxfc3RhcnQgPSB2
ZmlvX2xvZ19nbG9iYWxfc3RhcnQsCj4gLmxvZ19nbG9iYWxfc3RvcCA9IHZmaW9fbG9nX2dsb2Jh
bF9zdG9wLAo+Ci5sb2dfZ2xvYmFsX3N0YXJ0IGlzIGFsc28gYSBnb29kIHBvaW50IHRvIG5vdGlm
eSBsb2dnaW5nIHN0YXRlLgpCdXQgaWYgbm90aWZ5aW5nIGluIC5zYXZlX3NldHVwIGhhbmRsZXIs
IHdlIGNhbiBkbyBmaW5lLWdyYWluZWQKY29udHJvbCBvZiB3aGVuIHRvIG5vdGlmeSBvZiBsb2dn
aW5nIHN0YXJ0aW5nIHRvZ2V0aGVyIHdpdGggZ2V0X2J1ZmZlcgpvcGVyYXRpb24uCklzIHRoZXJl
IGFueSBzcGVjaWFsIGJlbmlmaXQgYnkgcmVnaXN0ZXJpbmcgdG8gLmxvZ19nbG9iYWxfc3RhcnQv
c3RvcD8KCgo+IFJlZ2FyZHMsCj4gLUdvbmdsZWkKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
