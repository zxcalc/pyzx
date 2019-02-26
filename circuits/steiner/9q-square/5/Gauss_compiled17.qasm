// Initial wiring: [5 1 3 2 7 0 4 6 8]
// Resulting wiring: [4 1 3 2 7 0 5 6 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[1];
cx q[6], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[6], q[7];
cx q[1], q[0];
cx q[7], q[4];
