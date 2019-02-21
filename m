Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp5141105ywa;
        Wed, 20 Feb 2019 20:13:37 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbkG8xw7gOsT7RC/imF3i9zmbJkSN3hVbLW9j8qO50YKZdtazdT1iyT548mQcuq2WPJxnzw
X-Received: by 2002:a17:902:2f:: with SMTP id 44mr31629995pla.44.1550722417000;
        Wed, 20 Feb 2019 20:13:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550722416; cv=none;
        d=google.com; s=arc-20160816;
        b=CvDEL4iyUt4f12uBsRrl7RaAQd98BRL3T1BB1DPngDZUaPaqfC/OSTt6lgrTP4FPQG
         nvmloCyyA3aq8GH3t3ySdk2W+C43rBYSneIRt6LX6xq0ETyCkBAWa95LYA6ZFA1LsjOW
         evcBqOFqHal0ZZhRj3SQReWaGnNLZE97XFXVxJ3Hbgp9NmYgnEM2wm2Nofcz+BG1dSD+
         yIho86ZZdzzslPP1D+83QmeppYBxw/Uf2PDQJ6bPypir/HbBF3lknweZamb/5/03myNI
         5T15GUUpbeOmQIor9cqfpMAJ1Ayhbr2+C5SgZXlJdt0quC5lrZvmwGzSIF/3Ydz4nQN1
         4DbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=F3khuNxiNxvO08WlSNo7zUmCGdsK+6KCSV1m+hHAXJE=;
        b=IR0MTpG5NCX525HniPPkuUxlu93RMEaHRGdg74oRNodG3M/NmRT/o/ty2Lj0IOxhaf
         3LNtRKsY2KB4vd5IPTj8bfvnKOq6u+KTxe4K2zZJngrnSqDqUODx8PqCWnnYDuZoWtXC
         kAVTZXhFqmnASFEBzUqffc4Kx/vSNlY9fWD82u09Y42ocSfrGOHgyo3mXDexAuOHEsgB
         zt1b1MoseLfakT/EQgrRF3E3YNuzjbhMe1xV8ck5sT386eHu8AXyIVUyP0UwvG8WCQm0
         LlpgqHLZ0pgODutfshQx4uXKlinpGMBvDLLBJ5hmnZtSKedzyhTtgxnjmt/TKdVx38Y4
         V0Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id g5si9853046pfi.60.2019.02.20.20.13.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Feb 2019 20:13:36 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23A48902A;
	Thu, 21 Feb 2019 04:13:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFA38902A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Feb 2019 04:13:34 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2019 20:13:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,393,1544515200"; d="scan'208";a="135949581"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by orsmga002.jf.intel.com with ESMTP; 20 Feb 2019 20:13:29 -0800
Date: Wed, 20 Feb 2019 23:08:15 -0500
From: Zhao Yan <yan.y.zhao@intel.com>
To: "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: Re: [PATCH 0/5] QEMU VFIO live migration
Message-ID: <20190221040815.GN16456@joy-OptiPlex-7040>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <33183CC9F5247A488A2544077AF19020DB25D374@dggeml511-mbx.china.huawei.com>
 <20190221002444.GH16456@joy-OptiPlex-7040>
 <33183CC9F5247A488A2544077AF19020DB25E1F3@dggeml511-mbx.china.huawei.com>
 <20190221015837.GK16456@joy-OptiPlex-7040>
 <33183CC9F5247A488A2544077AF19020DB25E834@dggeml511-mbx.china.huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33183CC9F5247A488A2544077AF19020DB25E834@dggeml511-mbx.china.huawei.com>
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
 "felipe@nutanix.com" <felipe@nutanix.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "changpeng.liu@intel.com" <changpeng.liu@intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCBGZWIgMjEsIDIwMTkgYXQgMDM6MzM6MjRBTSArMDAwMCwgR29uZ2xlaSAoQXJlaSkg
d3JvdGU6Cj4gCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gRnJvbTogWmhhbyBZ
YW4gW21haWx0bzp5YW4ueS56aGFvQGludGVsLmNvbV0KPiA+IFNlbnQ6IFRodXJzZGF5LCBGZWJy
dWFyeSAyMSwgMjAxOSA5OjU5IEFNCj4gPiBUbzogR29uZ2xlaSAoQXJlaSkgPGFyZWkuZ29uZ2xl
aUBodWF3ZWkuY29tPgo+ID4gQ2M6IGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tOyBxZW11LWRl
dmVsQG5vbmdudS5vcmc7Cj4gPiBpbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsg
Wmhlbmd4aWFvLnp4QEFsaWJhYmEtaW5jLmNvbTsKPiA+IHlpLmwubGl1QGludGVsLmNvbTsgZXNr
dWx0ZXRAcmVkaGF0LmNvbTsgeml5ZS55YW5nQGludGVsLmNvbTsKPiA+IGNvaHVja0ByZWRoYXQu
Y29tOyBzaHVhbmd0YWkudHN0QGFsaWJhYmEtaW5jLmNvbTsgZGdpbGJlcnRAcmVkaGF0LmNvbTsK
PiA+IHpoaS5hLndhbmdAaW50ZWwuY29tOyBtbGV2aXRza0ByZWRoYXQuY29tOyBwYXNpY0BsaW51
eC5pYm0uY29tOwo+ID4gYWlrQG96bGFicy5ydTsgZWF1Z2VyQHJlZGhhdC5jb207IGZlbGlwZUBu
dXRhbml4LmNvbTsKPiA+IGpvbmF0aGFuLmRhdmllc0BudXRhbml4LmNvbTsgY2hhbmdwZW5nLmxp
dUBpbnRlbC5jb207IEtlbi5YdWVAYW1kLmNvbTsKPiA+IGt3YW5raGVkZUBudmlkaWEuY29tOyBr
ZXZpbi50aWFuQGludGVsLmNvbTsgY2ppYUBudmlkaWEuY29tOwo+ID4ga3ZtQHZnZXIua2VybmVs
Lm9yZwo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAwLzVdIFFFTVUgVkZJTyBsaXZlIG1pZ3JhdGlv
bgo+ID4gCj4gPiBPbiBUaHUsIEZlYiAyMSwgMjAxOSBhdCAwMTozNTo0M0FNICswMDAwLCBHb25n
bGVpIChBcmVpKSB3cm90ZToKPiA+ID4KPiA+ID4KPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQo+ID4gPiA+IEZyb206IFpoYW8gWWFuIFttYWlsdG86eWFuLnkuemhhb0BpbnRlbC5j
b21dCj4gPiA+ID4gU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDIxLCAyMDE5IDg6MjUgQU0KPiA+
ID4gPiBUbzogR29uZ2xlaSAoQXJlaSkgPGFyZWkuZ29uZ2xlaUBodWF3ZWkuY29tPgo+ID4gPiA+
IENjOiBhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbTsgcWVtdS1kZXZlbEBub25nbnUub3JnOwo+
ID4gPiA+IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBaaGVuZ3hpYW8uenhA
QWxpYmFiYS1pbmMuY29tOwo+ID4gPiA+IHlpLmwubGl1QGludGVsLmNvbTsgZXNrdWx0ZXRAcmVk
aGF0LmNvbTsgeml5ZS55YW5nQGludGVsLmNvbTsKPiA+ID4gPiBjb2h1Y2tAcmVkaGF0LmNvbTsg
c2h1YW5ndGFpLnRzdEBhbGliYWJhLWluYy5jb207Cj4gPiBkZ2lsYmVydEByZWRoYXQuY29tOwo+
ID4gPiA+IHpoaS5hLndhbmdAaW50ZWwuY29tOyBtbGV2aXRza0ByZWRoYXQuY29tOyBwYXNpY0Bs
aW51eC5pYm0uY29tOwo+ID4gPiA+IGFpa0BvemxhYnMucnU7IGVhdWdlckByZWRoYXQuY29tOyBm
ZWxpcGVAbnV0YW5peC5jb207Cj4gPiA+ID4gam9uYXRoYW4uZGF2aWVzQG51dGFuaXguY29tOyBj
aGFuZ3BlbmcubGl1QGludGVsLmNvbTsKPiA+IEtlbi5YdWVAYW1kLmNvbTsKPiA+ID4gPiBrd2Fu
a2hlZGVAbnZpZGlhLmNvbTsga2V2aW4udGlhbkBpbnRlbC5jb207IGNqaWFAbnZpZGlhLmNvbTsK
PiA+ID4gPiBrdm1Admdlci5rZXJuZWwub3JnCj4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAw
LzVdIFFFTVUgVkZJTyBsaXZlIG1pZ3JhdGlvbgo+ID4gPiA+Cj4gPiA+ID4gT24gV2VkLCBGZWIg
MjAsIDIwMTkgYXQgMTE6NTY6MDFBTSArMDAwMCwgR29uZ2xlaSAoQXJlaSkgd3JvdGU6Cj4gPiA+
ID4gPiBIaSB5YW4sCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhhbmtzIGZvciB5b3VyIHdvcmsuCj4g
PiA+ID4gPgo+ID4gPiA+ID4gSSBoYXZlIHNvbWUgc3VnZ2VzdGlvbnMgb3IgcXVlc3Rpb25zOgo+
ID4gPiA+ID4KPiA+ID4gPiA+IDEpIFdvdWxkIHlvdSBhZGQgbXNpeCBtb2RlIHN1cHBvcnQsPyBp
ZiBub3QsIHBscyBhZGQgYSBjaGVjayBpbgo+ID4gPiA+IHZmaW9fcGNpX3NhdmVfY29uZmlnKCks
IGxpa2VzIE52aWRpYSdzIHNvbHV0aW9uLgo+ID4gPiA+IG9rLgo+ID4gPiA+Cj4gPiA+ID4gPiAy
KSBXZSBzaG91bGQgc3RhcnQgdmZpbyBkZXZpY2VzIGJlZm9yZSB2Y3B1IHJlc3VtZXMsIHNvIHdl
IGNhbid0IHJlbHkgb24KPiA+IHZtCj4gPiA+ID4gc3RhcnQgY2hhbmdlIGhhbmRsZXIgY29tcGxl
dGVseS4KPiA+ID4gPiB2ZmlvIGRldmljZXMgaXMgYnkgZGVmYXVsdCBzZXQgdG8gcnVubmluZyBz
dGF0ZS4KPiA+ID4gPiBJbiB0aGUgdGFyZ2V0IG1hY2hpbmUsIGl0cyBzdGF0ZSB0cmFuc2l0aW9u
IGZsb3cgaXMgcnVubmluZy0+c3RvcC0+cnVubmluZy4KPiA+ID4KPiA+ID4gVGhhdCdzIGNvbmZ1
c2luZy4gV2Ugc2hvdWxkIHN0YXJ0IHZmaW8gZGV2aWNlcyBhZnRlciB2ZmlvX2xvYWRfc3RhdGUs
Cj4gPiBvdGhlcndpc2UKPiA+ID4gaG93IGNhbiB5b3Uga2VlcCB0aGUgZGV2aWNlcycgaW5mb3Jt
YXRpb24gYXJlIHRoZSBzYW1lIGJldHdlZW4gc291cmNlIHNpZGUKPiA+ID4gYW5kIGRlc3RpbmF0
aW9uIHNpZGU/Cj4gPiA+Cj4gPiBzbywgeW91ciBtZWFuaW5nIGlzIHRvIHNldCBkZXZpY2Ugc3Rh
dGUgdG8gcnVubmluZyBpbiB0aGUgZmlyc3QgY2FsbCB0bwo+ID4gdmZpb19sb2FkX3N0YXRlPwo+
ID4gCj4gTm8sIGl0IHNob3VsZCBzdGFydCBkZXZpY2VzIGFmdGVyIHZmaW9fbG9hZF9zdGF0ZSBh
bmQgYmVmb3JlIHZjcHUgcmVzdW1pbmcuCj4KCldoYXQgYWJvdXQgc2V0IGRldmljZSBzdGF0ZSB0
byBydW5uaW5nIGluIGxvYWRfY2xlYW51cCBoYW5kbGVyID8KCj4gPiA+ID4gc28sIG1heWJlIHlv
dSBjYW4gaWdub3JlIHRoZSBzdG9wIG5vdGlmaWNhdGlvbiBpbiBrZXJuZWw/Cj4gPiA+ID4gPiAz
KSBXZSdkIGJldHRlciBzdXBwb3J0IGxpdmUgbWlncmF0aW9uIHJvbGxiYWNrIHNpbmNlIGhhdmUg
bWFueSBmYWlsdXJlCj4gPiA+ID4gc2NlbmFyaW9zLAo+ID4gPiA+ID4gIHJlZ2lzdGVyIGEgbWln
cmF0aW9uIG5vdGlmaWVyIGlzIGEgZ29vZCBjaG9pY2UuCj4gPiA+ID4gSSB0aGluayB0aGlzIHBh
dGNoc2V0IGNhbiBhbHNvIGhhbmRsZSB0aGUgZmFpbHVyZSBjYXNlIHdlbGwuCj4gPiA+ID4gaWYg
bWlncmF0aW9uIGZhaWx1cmUgb3IgY2FuY2VsbGluZyBoYXBwZW5zLAo+ID4gPiA+IGluIGNsZWFu
dXAgaGFuZGxlciwgTE9HR0lORyBzdGF0ZSBpcyBjbGVhcmVkLiBkZXZpY2Ugc3RhdGUocnVubmlu
ZyBvcgo+ID4gPiA+IHN0b3BwZWQpIGtlZXBzIGFzIGl0IGlzKS4KPiA+ID4KPiA+ID4gSUlSQyB0
aGVyZSdyZSBtYW55IGZhaWx1cmUgcGF0aHMgZG9uJ3QgY2FsbGluZyBjbGVhbnVwIGhhbmRsZXIu
Cj4gPiA+Cj4gPiBjb3VsZCB5b3UgdGFrZSBhbiBleGFtcGxlPwo+IAo+IE5ldmVyIG1pbmQsIHRo
YXQncyBhbm90aGVyIGJ1ZyBJIHRoaW5rLiAKPiAKPiA+ID4gPiB0aGVuLAo+ID4gPiA+IGlmIHZt
IHN3aXRjaGVzIGJhY2sgdG8gcnVubmluZywgZGV2aWNlIHN0YXRlIHdpbGwgYmUgc2V0IHRvIHJ1
bm5pbmc7Cj4gPiA+ID4gaWYgdm0gc3RheWVzIGF0IHN0b3BwZWQgc3RhdGUsIGRldmljZSBzdGF0
ZSBpcyBhbHNvIHN0b3BwZWQgKGl0IGhhcyBubwo+ID4gPiA+IG1lYW5pbmcgdG8gbGV0IGl0IGlu
IHJ1bm5pbmcgc3RhdGUpLgo+ID4gPiA+IERvIHlvdSB0aGluayBzbyA/Cj4gPiA+ID4KPiA+ID4g
SUYgdGhlIHVuZGVybHlpbmcgc3RhdGUgbWFjaGluZSBpcyBjb21wbGljYXRlZCwKPiA+ID4gV2Ug
c2hvdWxkIHRlbGwgdGhlIGNhbmNlbGluZyBzdGF0ZSB0byB2ZW5kb3IgZHJpdmVyIHByb2FjdGl2
ZWx5Lgo+ID4gPgo+ID4gVGhhdCBtYWtlcyBzZW5zZS4KPiA+IAo+ID4gPiA+ID4gNCkgRm91ciBt
ZW1vcnkgcmVnaW9uIGZvciBsaXZlIG1pZ3JhdGlvbiBpcyB0b28gY29tcGxpY2F0ZWQgSU1ITy4K
PiA+ID4gPiBvbmUgYmlnIHJlZ2lvbiByZXF1aXJlcyB0aGUgc3ViLXJlZ2lvbnMgd2VsbCBwYWRk
ZWQuCj4gPiA+ID4gbGlrZSBmb3IgdGhlIGZpcnN0IGNvbnRyb2wgZmllbGRzLCB0aGV5IGhhdmUg
dG8gYmUgcGFkZGVkIHRvIDRLLgo+ID4gPiA+IHRoZSBzYW1lIGZvciBvdGhlciBkYXRhIGZpZWxk
cy4KPiA+ID4gPiBPdGhlcndpc2UsIG1tYXAgc2ltcGx5IGZhaWxzLCBiZWNhdXNlIHRoZSBzdGFy
dC1vZmZzZXQgYW5kIHNpemUgZm9yIG1tYXAKPiA+ID4gPiBib3RoIG5lZWQgdG8gYmUgUEFHRSBh
bGlnbmVkLgo+ID4gPiA+Cj4gPiA+IEJ1dCBpZiB3ZSBkb24ndCBuZWVkIHVzZSBtbWFwIGZvciBj
b250cm9sIGZpbGVkIGFuZCBkZXZpY2Ugc3RhdGUsIHRoZXkgYXJlCj4gPiBzbWFsbCBiYXNpY2Fs
bHkuCj4gPiA+IFRoZSBwZXJmb3JtYW5jZSBpcyBlbm91Z2ggdXNpbmcgcHJlYWQvcHdyaXRlLgo+
ID4gPgo+ID4gd2UgZG9uJ3QgbW1hcCBjb250cm9sIGZpZWxkcy4gYnV0IGlmIGRhdGEgZmllbGRz
IGdvaW5nIGltbWVkYXRlbHkgYWZ0ZXIKPiA+IGNvbnRyb2wgZmllbGRzIChlLmcuIGp1c3QgNjQg
Ynl0ZXMpLCB3ZSBjYW4ndCBtbWFwIGRhdGEgZmllbGRzCj4gPiBzdWNjZXNzZnVsbHkgYmVjYXVz
ZSBpdHMgc3RhcnQgb2Zmc2V0IGlzIDY0LiBUaGVyZWZvcmUgY29udHJvbCBmaWVsZHMgaGF2ZQo+
ID4gdG8gYmUgcGFkZGVkIHRvIDRrIHRvIGxldCBkYXRhIGZpZWxkcyBzdGFydCBmcm9tIDRrLgo+
ID4gVGhhdCdzIHRoZSBkcmF3YmFjayBvZiBvbmUgYmlnIHJlZ2lvbiBob2xkaW5nIGJvdGggY29u
dHJvbCBhbmQgZGF0YSBmaWVsZHMuCj4gPiAKPiA+ID4gPiBBbHNvLCA0IHJlZ2lvbnMgaXMgY2xl
YXJlciBpbiBteSB2aWV3IDopCj4gPiA+ID4KPiA+ID4gPiA+IDUpIEFib3V0IGxvZyBzeW5jLCB3
aHkgbm90IHJlZ2lzdGVyIGxvZ19nbG9iYWxfc3RhcnQvc3RvcCBpbgo+ID4gPiA+IHZmaW9fbWVt
b3J5X2xpc3RlbmVyPwo+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gc2VlbXMgbG9nX2dsb2Jh
bF9zdGFydC9zdG9wIGNhbm5vdCBiZSBpdGVyYXRlbHkgY2FsbGVkIGluIHByZS1jb3B5IHBoYXNl
Pwo+ID4gPiA+IGZvciBkaXJ0eSBwYWdlcyBpbiBzeXN0ZW0gbWVtb3J5LCBpdCdzIGJldHRlciB0
byB0cmFuc2ZlciBkaXJ0eSBkYXRhCj4gPiA+ID4gaXRlcmF0aXZlbHkgdG8gcmVkdWNlIGRvd24g
dGltZSwgcmlnaHQ/Cj4gPiA+ID4KPiA+ID4KPiA+ID4gV2UganVzdCBuZWVkIGludm9raW5nIG9u
bHkgb25jZSBmb3Igc3RhcnQgYW5kIHN0b3AgbG9nZ2luZy4gV2h5IHdlIG5lZWQgdG8KPiA+IGNh
bGwKPiA+ID4gdGhlbSBsaXRlcmF0ZWx5PyBTZWUgbWVtb3J5X2xpc3RlbmVyIG9mIHZob3N0Lgo+
ID4gPgo+ID4gCj4gPiAKPiA+IAo+ID4gPiBSZWdhcmRzLAo+ID4gPiAtR29uZ2xlaQo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gaW50ZWwtZ3Z0LWRl
diBtYWlsaW5nIGxpc3QKPiBpbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRl
dgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1n
dnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1k
ZXY=
