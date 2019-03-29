// Initial wiring: [1, 19, 7, 17, 0, 14, 16, 13, 6, 2, 5, 18, 8, 10, 11, 12, 4, 3, 9, 15]
// Resulting wiring: [1, 19, 7, 17, 0, 14, 16, 13, 6, 2, 5, 18, 8, 10, 11, 12, 4, 3, 9, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[13];
cx q[13], q[7];
cx q[14], q[13];
cx q[18], q[19];
cx q[11], q[12];
cx q[10], q[19];
cx q[7], q[8];
cx q[1], q[7];
