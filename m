Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp5058842ywa;
        Wed, 20 Feb 2019 18:03:59 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZKkoOXn97XBaWRfWwR+rwQGaejIDSc7wZizRKHBnFQ+Y2ccSgaPorfOBymtW90nzpQz9Ux
X-Received: by 2002:a63:f816:: with SMTP id n22mr32184779pgh.146.1550714639178;
        Wed, 20 Feb 2019 18:03:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550714639; cv=none;
        d=google.com; s=arc-20160816;
        b=CSkfOJ/1G60kfUCUlGDuE5Mc55Goy070nNbRX4cjgLvQAJF3+DDMtLyBu2JeQ7rMqP
         7kUmelZZ7GwbHSB582sFkmB8DMikoGfD8+Xg+kWCZT8+yBcKEtHJRacPLkv+Nszp6oz+
         XDrJHEmydRHknLaibNGGp80asNYSpbs5F0eKgOJk0LX7Mg11CyVoDtBR0f2C3QOjzY2z
         L4VRN8aJBydfBQmPZeUnP65ttfHhQc39QuZz+YKuP1cIEkYC1ld0K3qqLrF06kYGZyrZ
         s/sZhTB62ZfuBAvopjLBmVbyTbcq3suiE/iP8lE2Q6XbSVcYk2Q5e3WprIA6I9o6bv5q
         +sig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=QxSvvDwtRJhEOuwAVtxR/2uejVEzU14jYuT/ku3Ic+g=;
        b=Lt9f8OxtKn0Q+6sXfx/ZdYzyJnEHycQuUXNIZZKVX/B20iZ5PdVLlwHmFSuII75zou
         xkrWO00gMonMXhGW9wn2EZkLIpHC/WQtdeO327tq1Nxe+I5u6441CCcn8Kxq6ftaV12e
         VtohBQb1+sLkNy40tAovCF/TGLUnR8Lk082EEit3vBSYs9CpUtfxRSw7nnD6x7+HIA+H
         PB2i+edPZBhob8xv4BAsr1jRhew2cDebkesH/XyqljAS9sb/33dEQ8etaZvntVpddPJO
         ho8lLYuIl7oj8ixhDamo1YKmzDiNnKzA9NjMDKJ4tLOrxHk1ummTRR2pVFus+URDMGg4
         huVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id e16si6947436pgv.436.2019.02.20.18.03.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Feb 2019 18:03:59 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31596890B8;
	Thu, 21 Feb 2019 02:03:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B4E890B8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Feb 2019 02:03:57 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2019 18:03:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,393,1544515200"; d="scan'208";a="128085115"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by orsmga003.jf.intel.com with ESMTP; 20 Feb 2019 18:03:52 -0800
Date: Wed, 20 Feb 2019 20:58:37 -0500
From: Zhao Yan <yan.y.zhao@intel.com>
To: "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: Re: [PATCH 0/5] QEMU VFIO live migration
Message-ID: <20190221015837.GK16456@joy-OptiPlex-7040>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <33183CC9F5247A488A2544077AF19020DB25D374@dggeml511-mbx.china.huawei.com>
 <20190221002444.GH16456@joy-OptiPlex-7040>
 <33183CC9F5247A488A2544077AF19020DB25E1F3@dggeml511-mbx.china.huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33183CC9F5247A488A2544077AF19020DB25E1F3@dggeml511-mbx.china.huawei.com>
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

T24gVGh1LCBGZWIgMjEsIDIwMTkgYXQgMDE6MzU6NDNBTSArMDAwMCwgR29uZ2xlaSAoQXJlaSkg
d3JvdGU6Cj4gCj4gCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gRnJvbTogWmhh
byBZYW4gW21haWx0bzp5YW4ueS56aGFvQGludGVsLmNvbV0KPiA+IFNlbnQ6IFRodXJzZGF5LCBG
ZWJydWFyeSAyMSwgMjAxOSA4OjI1IEFNCj4gPiBUbzogR29uZ2xlaSAoQXJlaSkgPGFyZWkuZ29u
Z2xlaUBodWF3ZWkuY29tPgo+ID4gQ2M6IGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tOyBxZW11
LWRldmVsQG5vbmdudS5vcmc7Cj4gPiBpbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgWmhlbmd4aWFvLnp4QEFsaWJhYmEtaW5jLmNvbTsKPiA+IHlpLmwubGl1QGludGVsLmNvbTsg
ZXNrdWx0ZXRAcmVkaGF0LmNvbTsgeml5ZS55YW5nQGludGVsLmNvbTsKPiA+IGNvaHVja0ByZWRo
YXQuY29tOyBzaHVhbmd0YWkudHN0QGFsaWJhYmEtaW5jLmNvbTsgZGdpbGJlcnRAcmVkaGF0LmNv
bTsKPiA+IHpoaS5hLndhbmdAaW50ZWwuY29tOyBtbGV2aXRza0ByZWRoYXQuY29tOyBwYXNpY0Bs
aW51eC5pYm0uY29tOwo+ID4gYWlrQG96bGFicy5ydTsgZWF1Z2VyQHJlZGhhdC5jb207IGZlbGlw
ZUBudXRhbml4LmNvbTsKPiA+IGpvbmF0aGFuLmRhdmllc0BudXRhbml4LmNvbTsgY2hhbmdwZW5n
LmxpdUBpbnRlbC5jb207IEtlbi5YdWVAYW1kLmNvbTsKPiA+IGt3YW5raGVkZUBudmlkaWEuY29t
OyBrZXZpbi50aWFuQGludGVsLmNvbTsgY2ppYUBudmlkaWEuY29tOwo+ID4ga3ZtQHZnZXIua2Vy
bmVsLm9yZwo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAwLzVdIFFFTVUgVkZJTyBsaXZlIG1pZ3Jh
dGlvbgo+ID4gCj4gPiBPbiBXZWQsIEZlYiAyMCwgMjAxOSBhdCAxMTo1NjowMUFNICswMDAwLCBH
b25nbGVpIChBcmVpKSB3cm90ZToKPiA+ID4gSGkgeWFuLAo+ID4gPgo+ID4gPiBUaGFua3MgZm9y
IHlvdXIgd29yay4KPiA+ID4KPiA+ID4gSSBoYXZlIHNvbWUgc3VnZ2VzdGlvbnMgb3IgcXVlc3Rp
b25zOgo+ID4gPgo+ID4gPiAxKSBXb3VsZCB5b3UgYWRkIG1zaXggbW9kZSBzdXBwb3J0LD8gaWYg
bm90LCBwbHMgYWRkIGEgY2hlY2sgaW4KPiA+IHZmaW9fcGNpX3NhdmVfY29uZmlnKCksIGxpa2Vz
IE52aWRpYSdzIHNvbHV0aW9uLgo+ID4gb2suCj4gPiAKPiA+ID4gMikgV2Ugc2hvdWxkIHN0YXJ0
IHZmaW8gZGV2aWNlcyBiZWZvcmUgdmNwdSByZXN1bWVzLCBzbyB3ZSBjYW4ndCByZWx5IG9uIHZt
Cj4gPiBzdGFydCBjaGFuZ2UgaGFuZGxlciBjb21wbGV0ZWx5Lgo+ID4gdmZpbyBkZXZpY2VzIGlz
IGJ5IGRlZmF1bHQgc2V0IHRvIHJ1bm5pbmcgc3RhdGUuCj4gPiBJbiB0aGUgdGFyZ2V0IG1hY2hp
bmUsIGl0cyBzdGF0ZSB0cmFuc2l0aW9uIGZsb3cgaXMgcnVubmluZy0+c3RvcC0+cnVubmluZy4K
PiAKPiBUaGF0J3MgY29uZnVzaW5nLiBXZSBzaG91bGQgc3RhcnQgdmZpbyBkZXZpY2VzIGFmdGVy
IHZmaW9fbG9hZF9zdGF0ZSwgb3RoZXJ3aXNlCj4gaG93IGNhbiB5b3Uga2VlcCB0aGUgZGV2aWNl
cycgaW5mb3JtYXRpb24gYXJlIHRoZSBzYW1lIGJldHdlZW4gc291cmNlIHNpZGUKPiBhbmQgZGVz
dGluYXRpb24gc2lkZT8KPgpzbywgeW91ciBtZWFuaW5nIGlzIHRvIHNldCBkZXZpY2Ugc3RhdGUg
dG8gcnVubmluZyBpbiB0aGUgZmlyc3QgY2FsbCB0bwp2ZmlvX2xvYWRfc3RhdGU/Cgo+ID4gc28s
IG1heWJlIHlvdSBjYW4gaWdub3JlIHRoZSBzdG9wIG5vdGlmaWNhdGlvbiBpbiBrZXJuZWw/Cj4g
PiA+IDMpIFdlJ2QgYmV0dGVyIHN1cHBvcnQgbGl2ZSBtaWdyYXRpb24gcm9sbGJhY2sgc2luY2Ug
aGF2ZSBtYW55IGZhaWx1cmUKPiA+IHNjZW5hcmlvcywKPiA+ID4gIHJlZ2lzdGVyIGEgbWlncmF0
aW9uIG5vdGlmaWVyIGlzIGEgZ29vZCBjaG9pY2UuCj4gPiBJIHRoaW5rIHRoaXMgcGF0Y2hzZXQg
Y2FuIGFsc28gaGFuZGxlIHRoZSBmYWlsdXJlIGNhc2Ugd2VsbC4KPiA+IGlmIG1pZ3JhdGlvbiBm
YWlsdXJlIG9yIGNhbmNlbGxpbmcgaGFwcGVucywKPiA+IGluIGNsZWFudXAgaGFuZGxlciwgTE9H
R0lORyBzdGF0ZSBpcyBjbGVhcmVkLiBkZXZpY2Ugc3RhdGUocnVubmluZyBvcgo+ID4gc3RvcHBl
ZCkga2VlcHMgYXMgaXQgaXMpLgo+IAo+IElJUkMgdGhlcmUncmUgbWFueSBmYWlsdXJlIHBhdGhz
IGRvbid0IGNhbGxpbmcgY2xlYW51cCBoYW5kbGVyLgo+CmNvdWxkIHlvdSB0YWtlIGFuIGV4YW1w
bGU/Cj4gPiB0aGVuLAo+ID4gaWYgdm0gc3dpdGNoZXMgYmFjayB0byBydW5uaW5nLCBkZXZpY2Ug
c3RhdGUgd2lsbCBiZSBzZXQgdG8gcnVubmluZzsKPiA+IGlmIHZtIHN0YXllcyBhdCBzdG9wcGVk
IHN0YXRlLCBkZXZpY2Ugc3RhdGUgaXMgYWxzbyBzdG9wcGVkIChpdCBoYXMgbm8KPiA+IG1lYW5p
bmcgdG8gbGV0IGl0IGluIHJ1bm5pbmcgc3RhdGUpLgo+ID4gRG8geW91IHRoaW5rIHNvID8KPiA+
IAo+IElGIHRoZSB1bmRlcmx5aW5nIHN0YXRlIG1hY2hpbmUgaXMgY29tcGxpY2F0ZWQsCj4gV2Ug
c2hvdWxkIHRlbGwgdGhlIGNhbmNlbGluZyBzdGF0ZSB0byB2ZW5kb3IgZHJpdmVyIHByb2FjdGl2
ZWx5Lgo+IApUaGF0IG1ha2VzIHNlbnNlLgoKPiA+ID4gNCkgRm91ciBtZW1vcnkgcmVnaW9uIGZv
ciBsaXZlIG1pZ3JhdGlvbiBpcyB0b28gY29tcGxpY2F0ZWQgSU1ITy4KPiA+IG9uZSBiaWcgcmVn
aW9uIHJlcXVpcmVzIHRoZSBzdWItcmVnaW9ucyB3ZWxsIHBhZGRlZC4KPiA+IGxpa2UgZm9yIHRo
ZSBmaXJzdCBjb250cm9sIGZpZWxkcywgdGhleSBoYXZlIHRvIGJlIHBhZGRlZCB0byA0Sy4KPiA+
IHRoZSBzYW1lIGZvciBvdGhlciBkYXRhIGZpZWxkcy4KPiA+IE90aGVyd2lzZSwgbW1hcCBzaW1w
bHkgZmFpbHMsIGJlY2F1c2UgdGhlIHN0YXJ0LW9mZnNldCBhbmQgc2l6ZSBmb3IgbW1hcAo+ID4g
Ym90aCBuZWVkIHRvIGJlIFBBR0UgYWxpZ25lZC4KPiA+IAo+IEJ1dCBpZiB3ZSBkb24ndCBuZWVk
IHVzZSBtbWFwIGZvciBjb250cm9sIGZpbGVkIGFuZCBkZXZpY2Ugc3RhdGUsIHRoZXkgYXJlIHNt
YWxsIGJhc2ljYWxseS4KPiBUaGUgcGVyZm9ybWFuY2UgaXMgZW5vdWdoIHVzaW5nIHByZWFkL3B3
cml0ZS4gCj4gCndlIGRvbid0IG1tYXAgY29udHJvbCBmaWVsZHMuIGJ1dCBpZiBkYXRhIGZpZWxk
cyBnb2luZyBpbW1lZGF0ZWx5IGFmdGVyCmNvbnRyb2wgZmllbGRzIChlLmcuIGp1c3QgNjQgYnl0
ZXMpLCB3ZSBjYW4ndCBtbWFwIGRhdGEgZmllbGRzCnN1Y2Nlc3NmdWxseSBiZWNhdXNlIGl0cyBz
dGFydCBvZmZzZXQgaXMgNjQuIFRoZXJlZm9yZSBjb250cm9sIGZpZWxkcyBoYXZlCnRvIGJlIHBh
ZGRlZCB0byA0ayB0byBsZXQgZGF0YSBmaWVsZHMgc3RhcnQgZnJvbSA0ay4KVGhhdCdzIHRoZSBk
cmF3YmFjayBvZiBvbmUgYmlnIHJlZ2lvbiBob2xkaW5nIGJvdGggY29udHJvbCBhbmQgZGF0YSBm
aWVsZHMuCgo+ID4gQWxzbywgNCByZWdpb25zIGlzIGNsZWFyZXIgaW4gbXkgdmlldyA6KQo+ID4g
Cj4gPiA+IDUpIEFib3V0IGxvZyBzeW5jLCB3aHkgbm90IHJlZ2lzdGVyIGxvZ19nbG9iYWxfc3Rh
cnQvc3RvcCBpbgo+ID4gdmZpb19tZW1vcnlfbGlzdGVuZXI/Cj4gPiA+Cj4gPiA+Cj4gPiBzZWVt
cyBsb2dfZ2xvYmFsX3N0YXJ0L3N0b3AgY2Fubm90IGJlIGl0ZXJhdGVseSBjYWxsZWQgaW4gcHJl
LWNvcHkgcGhhc2U/Cj4gPiBmb3IgZGlydHkgcGFnZXMgaW4gc3lzdGVtIG1lbW9yeSwgaXQncyBi
ZXR0ZXIgdG8gdHJhbnNmZXIgZGlydHkgZGF0YQo+ID4gaXRlcmF0aXZlbHkgdG8gcmVkdWNlIGRv
d24gdGltZSwgcmlnaHQ/Cj4gPiAKPiAKPiBXZSBqdXN0IG5lZWQgaW52b2tpbmcgb25seSBvbmNl
IGZvciBzdGFydCBhbmQgc3RvcCBsb2dnaW5nLiBXaHkgd2UgbmVlZCB0byBjYWxsCj4gdGhlbSBs
aXRlcmF0ZWx5PyBTZWUgbWVtb3J5X2xpc3RlbmVyIG9mIHZob3N0Lgo+IAoKCgo+IFJlZ2FyZHMs
Cj4gLUdvbmdsZWkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
bnRlbC1ndnQtZGV2
