// Initial wiring: [19, 5, 9, 0, 7, 6, 3, 2, 4, 10, 12, 8, 15, 13, 14, 17, 18, 1, 11, 16]
// Resulting wiring: [19, 5, 9, 0, 7, 6, 3, 2, 4, 10, 12, 8, 15, 13, 14, 17, 18, 1, 11, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[2];
cx q[8], q[7];
cx q[8], q[1];
cx q[13], q[12];
cx q[18], q[19];
cx q[13], q[14];
cx q[10], q[19];
cx q[2], q[3];
