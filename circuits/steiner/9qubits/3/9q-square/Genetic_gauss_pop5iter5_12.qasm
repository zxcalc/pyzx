// Initial wiring: [5 1 2 3 4 0 6 7 8]
// Resulting wiring: [5 1 2 3 4 0 6 7 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[1];
cx q[1], q[0];
cx q[4], q[7];
