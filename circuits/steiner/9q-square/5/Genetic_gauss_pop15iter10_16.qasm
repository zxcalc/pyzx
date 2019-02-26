// Initial wiring: [0 1 2 3 7 5 6 4 8]
// Resulting wiring: [0 1 2 3 5 4 6 7 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[7];
cx q[8], q[7];
cx q[4], q[7];
cx q[4], q[7];
cx q[4], q[7];
cx q[4], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[7], q[6];
cx q[7], q[8];
cx q[4], q[7];
