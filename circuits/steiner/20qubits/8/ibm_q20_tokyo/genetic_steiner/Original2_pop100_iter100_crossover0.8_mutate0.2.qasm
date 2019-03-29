// Initial wiring: [12, 10, 0, 11, 6, 17, 15, 1, 16, 19, 7, 8, 5, 3, 13, 14, 18, 9, 4, 2]
// Resulting wiring: [12, 10, 0, 11, 6, 17, 15, 1, 16, 19, 7, 8, 5, 3, 13, 14, 18, 9, 4, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[1];
cx q[13], q[6];
cx q[14], q[13];
cx q[16], q[14];
cx q[18], q[17];
cx q[18], q[19];
cx q[12], q[13];
cx q[10], q[11];
