// Initial wiring: [0 1 2 8 3 6 5 7 4]
// Resulting wiring: [0 1 2 8 3 6 5 7 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[4], q[1];
cx q[6], q[5];
cx q[2], q[3];
cx q[4], q[7];
