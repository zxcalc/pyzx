// Initial wiring: [0 1 2 8 4 5 6 3 7]
// Resulting wiring: [7 1 2 8 5 0 6 3 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[4], q[1];
cx q[3], q[8];
cx q[4], q[3];
cx q[0], q[5];
cx q[0], q[5];
cx q[5], q[4];
cx q[5], q[4];
cx q[5], q[4];
cx q[4], q[7];
cx q[4], q[7];
cx q[4], q[7];
cx q[3], q[8];
cx q[1], q[4];
cx q[8], q[7];
