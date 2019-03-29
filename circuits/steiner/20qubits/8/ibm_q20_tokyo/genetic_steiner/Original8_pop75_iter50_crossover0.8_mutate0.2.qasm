// Initial wiring: [17, 8, 3, 4, 6, 14, 1, 15, 0, 12, 16, 5, 18, 11, 19, 10, 9, 7, 13, 2]
// Resulting wiring: [17, 8, 3, 4, 6, 14, 1, 15, 0, 12, 16, 5, 18, 11, 19, 10, 9, 7, 13, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[7], q[6];
cx q[6], q[3];
cx q[13], q[6];
cx q[16], q[14];
cx q[18], q[17];
cx q[9], q[10];
cx q[7], q[13];
